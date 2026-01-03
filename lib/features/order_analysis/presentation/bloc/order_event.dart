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

  const OnNewOrderCaptured({required this.price, required this.distance});

  @override
  List<Object?> get props => [price, distance];
}

class OrdersUpdated extends OrderEvent {
  final double totalNetProfit;

  const OrdersUpdated(this.totalNetProfit);

  @override
  List<Object?> get props => [totalNetProfit];
}
