import 'package:isar/isar.dart';
import 'package:van_flow/core/models/order_mappers.dart';
import 'package:van_flow/core/models/order_model.dart';
import '../../../../core/models/order_entity.dart';
import '../../domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final Isar isar;

  OrderRepositoryImpl(this.isar);

  @override
  Future<void> saveOrder(OrderEntity order) async {
    await isar.writeTxn(() async {
      await isar.orderModels.put(order.toModel());
    });
  }

  @override
  Stream<List<OrderEntity>> watchOrders() {
    return isar.orderModels
        .where()
        .sortByTimestampDesc()
        .watch(fireImmediately: true)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<List<OrderEntity>> getAllOrders() async {
    final models = await isar.orderModels.where().sortByTimestampDesc().findAll();
    return models.map((m) => m.toEntity()).toList();
  }
}
