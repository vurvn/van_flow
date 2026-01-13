import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_notification_listener/flutter_notification_listener.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class PermissionService {
  /// Kiểm tra xem tất cả các quyền cần thiết đã được cấp chưa
  static Future<bool> hasAllPermissions() async {
    final notificationStatus = await Permission.notification.isGranted;
    final overlayStatus = await FlutterOverlayWindow.isPermissionGranted();
    final listenerStatus = await NotificationsListener.hasPermission;
    
    return notificationStatus && overlayStatus && (listenerStatus ?? false);
  }

  /// Yêu cầu các quyền cơ bản (Thông báo & Overlay)
  static Future<void> requestBasicPermissions() async {
    // 1. Quyền thông báo (Android 13+)
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }

    // 2. Quyền Overlay (Xuất hiện trên cùng)
    if (!(await FlutterOverlayWindow.isPermissionGranted())) {
      await FlutterOverlayWindow.requestPermission();
    }
  }

  /// Mở cài đặt để cấp quyền truy cập thông báo (Notification Listener)
  static Future<void> requestNotificationListenerPermission() async {
    final hasPermission = await NotificationsListener.hasPermission;
    if (hasPermission == null || !hasPermission) {
      await NotificationsListener.openPermissionSettings();
    }
  }
}
