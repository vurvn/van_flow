import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_event.dart';
import '../bloc/order_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('VAN FLOW DASHBOARD', 
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStatusCard(),
            const SizedBox(height: 20),
            _buildProfitDisplay(),
            const Spacer(),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (previous, current) => previous.isMonitoring != current.isMonitoring,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: state.isMonitoring ? Colors.greenAccent : Colors.redAccent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Icon(
                state.isMonitoring ? Icons.radar : Icons.power_settings_new,
                color: state.isMonitoring ? Colors.greenAccent : Colors.redAccent,
                size: 32,
              ),
              const SizedBox(width: 15),
              Text(
                state.isMonitoring ? 'MONITORING ACTIVE' : 'MONITORING INACTIVE',
                style: TextStyle(
                  color: state.isMonitoring ? Colors.greenAccent : Colors.redAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfitDisplay() {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (previous, current) => previous.totalNetProfit != current.totalNetProfit,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey[900]!, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: Column(
            children: [
              const Text(
                'TOTAL NET PROFIT',
                style: TextStyle(color: Colors.white70, fontSize: 16, letterSpacing: 2),
              ),
              const SizedBox(height: 10),
              Text(
                '${state.totalNetProfit.toStringAsFixed(0)} VND',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => context.read<OrderBloc>().add(StartMonitoring()),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('START MONITORING', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        // Simulated order button for demonstration
        OutlinedButton(
          onPressed: () => context.read<OrderBloc>().add(
            const OnNewOrderCaptured(price: 50000, distance: 5.0),
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white54,
            minimumSize: const Size(double.infinity, 50),
            side: const BorderSide(color: Colors.white24),
          ),
          child: const Text('SIMULATE NEW ORDER (50k VND, 5km)'),
        ),
      ],
    );
  }
}
