import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/order_monitor_bloc.dart';
import '../bloc/order_monitor_event.dart';
import '../bloc/order_monitor_state.dart';
import '../../domain/entities/order_entity.dart';

class OrderMonitorPage extends StatelessWidget {
  const OrderMonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<OrderMonitorBloc, OrderMonitorState>(
        builder: (context, state) {
          if (state is OrderMonitorLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.amber));
          } else if (state is OrderMonitorLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      return _OrderCard(order: state.orders[index]);
                    },
                  ),
                ),
                _buildActionButtons(context),
              ],
            );
          }
          return const Center(child: Text('Start monitoring to see orders', style: TextStyle(color: Colors.white70)));
        },
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () => context.read<OrderMonitorBloc>().add(
          const OrderAdded(platform: 'Grab', revenue: 75000, distance: 4.5),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text('SIMULATE NEW ORDER', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderEntity order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final bool isHighProfit = order.netProfit > 50000;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isHighProfit ? Colors.greenAccent : Colors.amberAccent,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.platform.toUpperCase(),
                style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                '${order.distance} km',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'NET PROFIT',
            style: TextStyle(color: Colors.white60, fontSize: 12),
          ),
          Text(
            '${order.netProfit.toStringAsFixed(0)} VND',
            style: TextStyle(
              color: isHighProfit ? Colors.greenAccent : Colors.amberAccent,
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
