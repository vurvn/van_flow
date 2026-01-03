import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final int? id;
  final String platform;
  final double revenue;
  final double distance;
  final DateTime timestamp;
  final double netProfit;

  const OrderEntity({
    this.id,
    required this.platform,
    required this.revenue,
    required this.distance,
    required this.timestamp,
    required this.netProfit,
  });

  @override
  List<Object?> get props => [id, platform, revenue, distance, timestamp, netProfit];
}
