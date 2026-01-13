import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'core/injection/injection.dart' as di;
import 'core/services/background_service.dart';
import 'core/services/district_service.dart';
import 'core/services/permission_service.dart';
import 'features/order_monitor/presentation/bloc/order_monitor_bloc.dart';
import 'features/profit_analytics/presentation/bloc/analytics_bloc.dart';
import 'presentation/pages/permission_page.dart';
import 'presentation/screens/main_screen.dart';
import 'presentation/widgets/order_overlay_widget.dart';

void main() async {
  // Đảm bảo Flutter framework đã sẵn sàng
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. Khởi tạo Dependency Injection (Isar, Repositories)
  try {
    await di.init();
  } catch (e) {
    debugPrint("DI Init Error: $e");
  }

  // 2. Seed dữ liệu vào Isar
  final isar = di.sl<Isar>();
  await DistrictService.seedDistricts(isar);

  // 3. FIX LỖI JSONException & TREO LOGO:
  // Nếu đã có quyền, khởi động Listener ngay để ghi đè cấu hình trống
  final hasPermissions = await PermissionService.hasAllPermissions();
  if (hasPermissions) {
    NotificationHandler.startListening();
  }

  runApp(const VanFlowApp());
}

@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const OrderOverlayWidget(),
    ),
  );
}

class VanFlowApp extends StatelessWidget {
  const VanFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<OrderMonitorBloc>()),
        BlocProvider(create: (_) => di.sl<AnalyticsBloc>()),
      ],
      child: MaterialApp(
        title: 'Van Flow',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.amber,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
        ),
        // Kiểm tra quyền để quyết định màn hình bắt đầu
        home: FutureBuilder<bool>(
          future: PermissionService.hasAllPermissions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.data == true) {
              return const MainScreen();
            }
            return const PermissionPage();
          },
        ),
      ),
    );
  }
}
