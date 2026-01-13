import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_notification_listener/flutter_notification_listener.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../injection/injection.dart' as di;
import '../models/district_profile.dart';
import '../models/order_model.dart';
import '../utils/score_engine.dart';
import '../utils/district_utils.dart';

/// Hàm xử lý thông báo cấp cao nhất (Top-level function)
/// Bắt buộc phải có @pragma('vm:entry-point') để Native có thể gọi vào
@pragma('vm:entry-point')
void onNotificationData(dynamic event) {
  if (event is NotificationEvent) {
    final String content = event.text ?? event.title ?? "";
    if (content.isNotEmpty) {
      _processNotificationContent(content);
    }
  }
}

class NotificationHandler {
  static Future<void> startListening() async {
    try {
      // Kiểm tra quyền trước khi start
      bool? hasPermission = await NotificationsListener.hasPermission;
      if (hasPermission != true) {
        debugPrint("VAN_FLOW_DEBUG: Missing Notification Access Permission");
        return;
      }
      // 1. Initialize plugin
      NotificationsListener.initialize();

      // 2. Khởi chạy Foreground Service
      await NotificationsListener.startService(
        foreground: true,
        title: "VanFlow Assistant",
        description: "Trợ lý đang lắng nghe đơn hàng...",
      );

      // 3. Đăng ký nhận dữ liệu qua Port
      // Sửa lỗi type mismatch: listen mong đợi Function(dynamic)
      // NotificationsListener.receivePort?.listen(onNotificationData);
      final port = NotificationsListener.receivePort;
      if (port != null) {
        port.listen((data) {
          // Bọc trong try-catch riêng để tránh hỏng cả Port nếu 1 tin nhắn lỗi
          try {
            onNotificationData(data);
          } catch (e) {
            debugPrint("VAN_FLOW_DEBUG: Message processing error: $e");
          }
        });
      }

      debugPrint("VAN_FLOW_DEBUG: Notification Handler is active");
    } catch (e) {
      debugPrint("VAN_FLOW_DEBUG: Error starting listener: $e");
    }
  }

  static void simulate(String content) {
    _processNotificationContent(content);
  }
}

@pragma('vm:entry-point')
Future<void> _processNotificationContent(String content) async {
  try {
    debugPrint("VAN_FLOW_DEBUG: Analyzing -> $content");

    final regExp = RegExp(
        r"Đơn mới:\s*([\d.]+).*\s*[–-]\s*(.*?)\s*(?:->|→|>)\s*(.*?)\s*[–-]\s*([\d.]+)\s*km",
        caseSensitive: false);

    final match = regExp.firstMatch(content);
    
    if (!di.sl.isRegistered<Isar>()) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = Isar.getInstance() ?? await Isar.open(
        [OrderModelSchema, DistrictProfileSchema],
        directory: dir.path,
      );
      if (!di.sl.isRegistered<Isar>()) {
        di.sl.registerLazySingleton<Isar>(() => isar);
      }
    }

    double fee = 0;
    String targetName = "Unknown";
    double distance = 0;

    if (match != null) {
      fee = double.parse(match.group(1)!.replaceAll('.', '').replaceAll(',', ''));
      targetName = match.group(3)!.trim();
      distance = double.parse(match.group(4)!);
    } else if (content.contains("test")) {
      fee = 520000;
      targetName = "Bình Tân";
      distance = 18.0;
    } else {
      return;
    }

    final targetDistrictId = DistrictUtils.normalizeId(targetName);
    final isar = di.sl<Isar>();
    final profile = await isar.districtProfiles
        .filter()
        .districtIdEqualTo(targetDistrictId)
        .findFirst();

    double score = 0;
    String decisionName = "consider";
    bool isVanFriendly = true;

    if (profile != null) {
      score = ScoreEngine.calculateScore(
          OrderInput(fee: fee, emptyKm: 2.0, trafficMinutes: 15), profile);
      decisionName = ScoreEngine.decisionFromScore(score).name;
      isVanFriendly = profile.isVanFriendly;
    } else {
      score = 45000; 
      decisionName = "accept";
    }

    if (!(await FlutterOverlayWindow.isActive())) {
      await FlutterOverlayWindow.showOverlay(
        enableDrag: true,
        overlayTitle: "TRỢ LÝ ĐƠN HÀNG",
        alignment: OverlayAlignment.center,
        height: 400,
        width: WindowSize.matchParent,
      );
      await Future.delayed(const Duration(milliseconds: 1500));
    }

    await FlutterOverlayWindow.shareData({
      "score": score,
      "decision": decisionName,
      "fee": fee,
      "target": targetName,
      "distance": distance,
      "isVanFriendly": isVanFriendly,
    });
    
    debugPrint("VAN_FLOW_DEBUG: Overlay delivery successful.");
  } catch (e) {
    debugPrint("VAN_FLOW_DEBUG ERROR: $e");
  }
}
