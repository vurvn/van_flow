import 'package:isar/isar.dart';
import '../../domain/entities/order_entity.dart';

part 'order_model.g.dart';

@collection
class OrderModel {
  Id id = Isar.autoIncrement;

  late String platform;
  late double revenue;
  late double distance;
  late DateTime timestamp;
  late double netProfit;

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      platform: platform,
      revenue: revenue,
      distance: distance,
      timestamp: timestamp,
      netProfit: netProfit,
    );
  }

  static OrderModel fromEntity(OrderEntity entity) {
    return OrderModel()
      ..id = entity.id ?? Isar.autoIncrement
      ..platform = entity.platform
      ..revenue = entity.revenue
      ..distance = entity.distance
      ..timestamp = entity.timestamp
      ..netProfit = entity.netProfit;
  }
}
