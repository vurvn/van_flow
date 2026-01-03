import 'package:isar/isar.dart';
import '../../domain/entities/order_entity.dart';

part 'order_model.g.dart';

@collection
class OrderModel {
  Id id = Isar.autoIncrement;

  late double price;
  late double distance;
  late double netProfit;

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      price: price,
      distance: distance,
      netProfit: netProfit,
    );
  }

  static OrderModel fromEntity(OrderEntity entity) {
    return OrderModel()
      ..price = entity.price
      ..distance = entity.distance
      ..netProfit = entity.netProfit;
  }
}
