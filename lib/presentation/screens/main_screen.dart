import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/order_monitor/presentation/pages/order_monitor_page.dart';
import '../../features/profit_analytics/presentation/pages/analytics_page.dart';
import '../pages/evaluation_page.dart';
import '../../features/order_monitor/presentation/bloc/order_monitor_bloc.dart';
import '../../features/order_monitor/presentation/bloc/order_monitor_event.dart';
import '../../features/profit_analytics/presentation/bloc/analytics_bloc.dart';
import '../../features/profit_analytics/presentation/bloc/analytics_event.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    EvaluationPage(),
    OrderMonitorPage(),
    AnalyticsPage(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<OrderMonitorBloc>().add(WatchOrdersStarted());
    context.read<AnalyticsBloc>().add(LoadAnalyticsStarted());
  }

  void _onTabTapped(int index) {
    if (index == 2) {
      // Khi nhấn vào tab PHÂN TÍCH (index 2), yêu cầu load lại dữ liệu
      context.read<AnalyticsBloc>().add(LoadAnalyticsStarted());
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VAN FLOW', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 2)),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped, // Sử dụng hàm xử lý mới
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white24,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'ĐÁNH GIÁ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar),
            label: 'THEO DÕI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'PHÂN TÍCH',
          ),
        ],
      ),
    );
  }
}
