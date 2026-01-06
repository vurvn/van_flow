import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final int? id;
  final String platform;
  final double revenue;
  final double distance;
  final DateTime timestamp;
  final double netProfit;
  final String? startDistrictId; // Added
  final String? startDistrictName; // Added
  final String? targetDistrictId; // Renamed from districtId
  final String? targetDistrictName; // Added
  final bool isCompleted;

  const OrderEntity({
    this.id,
    required this.platform,
    required this.revenue,
    required this.distance,
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
    timestamp, 
    netProfit, 
    startDistrictId, 
    startDistrictName, 
    targetDistrictId, 
    targetDistrictName, 
    isCompleted
  ];
}
