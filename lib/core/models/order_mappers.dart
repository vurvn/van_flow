import 'order_entity.dart';
import 'order_model.dart';
import 'package:isar/isar.dart';

extension OrderEntityMapper on OrderEntity {
  OrderModel toModel() {
    return OrderModel()
      ..id = id ?? Isar.autoIncrement
      ..platform = platform
      ..revenue = revenue
      ..distance = distance
      ..pickupKm = pickupKm
      ..deliveryKm = deliveryKm
      ..timestamp = timestamp
      ..netProfit = netProfit
      ..startDistrictId = startDistrictId
      ..startDistrictName = startDistrictName
      ..targetDistrictId = targetDistrictId
      ..targetDistrictName = targetDistrictName
      ..isCompleted = isCompleted;
  }
}

extension OrderModelMapper on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      platform: platform,
      revenue: revenue,
      distance: distance,
      pickupKm: pickupKm,
      deliveryKm: deliveryKm,
      timestamp: timestamp,
      netProfit: netProfit,
      startDistrictId: startDistrictId,
      startDistrictName: startDistrictName,
      targetDistrictId: targetDistrictId,
      targetDistrictName: targetDistrictName,
      isCompleted: isCompleted,
    );
  }
}
