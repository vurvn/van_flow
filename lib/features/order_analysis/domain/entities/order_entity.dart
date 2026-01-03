import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final int? id;
  final double price;
  final double distance;
  final double netProfit;

  const OrderEntity({
    this.id,
    required this.price,
    required this.distance,
    required this.netProfit,
  });

  @override
  List<Object?> get props => [id, price, distance, netProfit];
}
