import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final int? id;
  final String platform;
  final double revenue;
  final double distance;
  final double pickupKm; // Added
  final double deliveryKm; // Added
  final DateTime timestamp;
  final double netProfit;
  final String? startDistrictId;
  final String? startDistrictName;
  final String? targetDistrictId;
  final String? targetDistrictName;
  final bool isCompleted;

  const OrderEntity({
    this.id,
    required this.platform,
    required this.revenue,
    required this.distance,
    required this.pickupKm,
    required this.deliveryKm,
    required this.timestamp,
    required this.netProfit,
    this.startDistrictId,
    this.startDistrictName,
    this.targetDistrictId,
    this.targetDistrictName,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [
    id, 
    platform, 
    revenue, 
    distance, 
    pickupKm,
    deliveryKm,
    timestamp, 
    netProfit, 
    startDistrictId, 
    startDistrictName, 
    targetDistrictId, 
    targetDistrictName, 
    isCompleted
  ];
}
