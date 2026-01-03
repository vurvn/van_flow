import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  _buildSummaryCard('TOTAL REVENUE', summary.totalRevenue, Colors.blueGrey),
                  const SizedBox(height: 16),
                  _buildSummaryCard('TAKE-HOME PAY', summary.totalNetProfit, Colors.greenAccent),
                  const SizedBox(height: 32),
                  const Text(
                    'LAST 7 DAYS PROFIT',
                    style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildSimpleBarChart(summary.dailyProfits),
                ],
              ),
            );
          }
          return const Center(child: Text('No data available', style: TextStyle(color: Colors.white70)));
        },
      ),
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
    // Basic implementation of a bar chart using a Row of Containers
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
