import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/injection/injection.dart' as di;
import 'features/order_monitor/presentation/bloc/order_monitor_bloc.dart';
import 'features/profit_analytics/presentation/bloc/analytics_bloc.dart';
import 'presentation/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Khởi tạo Dependency Injection (Isar, Repositories, Blocs)
  await di.init();
  
  runApp(const VanFlowApp());
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
        title: 'Van Flow - Hỗ trợ tài xế',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.amber,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
