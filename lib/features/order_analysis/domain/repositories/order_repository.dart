import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<void> saveOrder(OrderEntity order);
  Stream<List<OrderEntity>> watchOrders();
  Future<List<OrderEntity>> getAllOrders();
}
