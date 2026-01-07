import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../district_map/presentation/pages/district_map_page.dart';
import '../bloc/analytics_bloc.dart';
import '../bloc/analytics_state.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<AnalyticsBloc, AnalyticsState>(
        buildWhen: (previous, current) => current is AnalyticsLoaded,
        builder: (context, state) {
          if (state is AnalyticsLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
          } else if (state is AnalyticsLoaded) {
            final summary = state.summary;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSummaryCard('TỔNG DOANH THU', summary.totalRevenue, Colors.blueGrey),
                  const SizedBox(height: 16),
                  _buildSummaryCard('THU NHẬP THỰC NHẬN', summary.totalNetProfit, Colors.greenAccent),
                  const SizedBox(height: 32),
                  const Text(
                    'LỢI NHUẬN 7 NGÀY QUA',
                    style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildSimpleBarChart(summary.dailyProfits),
                  const SizedBox(height: 32),
                  const Text(
                    'BẢN ĐỒ NHIỆT KHU VỰC',
                    style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dựa trên mật độ đơn hàng thực tế của bạn',
                    style: TextStyle(color: Colors.white24, fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  _buildHeatMapSection(),
                  const SizedBox(height: 24),
                ],
              ),
            );
          }
          return const Center(child: Text('Không có dữ liệu', style: TextStyle(color: Colors.white70)));
        },
      ),
    );
  }

  Widget _buildHeatMapSection() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
        // clipBehavior: Clip.antiAlias,
      ),
      child: const DistrictMapPage(showAppBar: false),
    );
  }

  Widget _buildSummaryCard(String title, double value, Color color) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white60, fontSize: 14, letterSpacing: 1.2)),
          const SizedBox(height: 8),
          Text(
            '${value.toStringAsFixed(0)} VND',
            style: TextStyle(color: color, fontSize: 28, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleBarChart(Map<DateTime, double> dailyProfits) {
    final sortedDates = dailyProfits.keys.toList()..sort();
    final last7Days = sortedDates.length > 7 ? sortedDates.sublist(sortedDates.length - 7) : sortedDates;
    
    double maxProfit = 1;
    for (var date in last7Days) {
      if (dailyProfits[date]! > maxProfit) maxProfit = dailyProfits[date]!;
    }

    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: last7Days.map((date) {
          final profit = dailyProfits[date]!;
          final heightFactor = profit / maxProfit;
          
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 30,
                height: 140 * heightFactor,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 1),
              Text(
                '${date.day}/${date.month}',
                style: const TextStyle(color: Colors.white54, fontSize: 10),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
