import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class StartMonitoring extends OrderEvent {}

class OnNewOrderCaptured extends OrderEvent {
  final double price;
  final double distance;
  final String? platform;
  final String? districtId;

  const OnNewOrderCaptured({
    required this.price, 
    required this.distance,
    this.platform,
    this.districtId,
  });

  @override
  List<Object?> get props => [price, distance, platform, districtId];
}

class OrdersUpdated extends OrderEvent {
  final double totalNetProfit;

  const OrdersUpdated(this.totalNetProfit);

  @override
  List<Object?> get props => [totalNetProfit];
}
