import 'package:equatable/equatable.dart';

abstract class OrderMonitorEvent extends Equatable {
  const OrderMonitorEvent();

  @override
  List<Object?> get props => [];
}

class WatchOrdersStarted extends OrderMonitorEvent {}

class OrderAdded extends OrderMonitorEvent {
  final String platform;
  final double revenue;
  final double distance;
  final String? districtId;

  const OrderAdded({
    required this.platform,
    required this.revenue,
    required this.distance,
    required this.districtId,
  });

  @override
  List<Object?> get props => [platform, revenue, distance, districtId];
}

class OrdersUpdated extends OrderMonitorEvent {
  final List<dynamic> orders;

  const OrdersUpdated(this.orders);

  @override
  List<Object?> get props => [orders];
}
