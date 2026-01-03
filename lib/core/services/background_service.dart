import 'dart:async';
import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import '../injection/injection.dart' as di;
import '../../features/order_analysis/domain/entities/order_entity.dart';
import '../../features/order_analysis/domain/repositories/order_repository.dart';
import '../../features/order_analysis/data/utils/profit_calculator.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      isForegroundMode: true,
      notificationChannelId: 'van_flow_service',
      initialNotificationTitle: 'Van Flow Active',
      initialNotificationContent: 'Monitoring orders...',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  
  // Re-initialize DI in the background isolate
  await di.init();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // Example: Listen for simulated notification/data capture
  // In a real app, this might be a method channel or a notification listener
  Timer.periodic(const Duration(minutes: 15), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        // Business logic: e.g., capture an order if found in notifications
        // This is where you'd use the Repository
        // final repository = di.sl<OrderRepository>();
        // ... capture logic ...
      }
    }
  });
}
