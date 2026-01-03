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

  const OrderAdded({
    required this.platform,
    required this.revenue,
    required this.distance,
  });

  @override
  List<Object?> get props => [platform, revenue, distance];
}

class OrdersUpdated extends OrderMonitorEvent {
  final List<dynamic> orders; // Using dynamic to avoid strict entity typing issues during setup

  const OrdersUpdated(this.orders);

  @override
  List<Object?> get props => [orders];
}
