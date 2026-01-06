import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/order_entity.dart';
import '../../../../core/utils/profit_calculator.dart';
import '../../domain/repositories/order_repository.dart';
import 'order_monitor_event.dart';
import 'order_monitor_state.dart';

class OrderMonitorBloc extends Bloc<OrderMonitorEvent, OrderMonitorState> {
  final OrderRepository _orderRepository;
  StreamSubscription? _ordersSubscription;

  OrderMonitorBloc({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(OrderMonitorInitial()) {
    on<WatchOrdersStarted>(_onWatchOrdersStarted);
    on<OrderAdded>(_onOrderAdded);
    on<OrdersUpdated>(_onOrdersUpdated);
  }

  void _onWatchOrdersStarted(WatchOrdersStarted event, Emitter<OrderMonitorState> emit) {
    emit(OrderMonitorLoading());
    _ordersSubscription?.cancel();
    _ordersSubscription = _orderRepository.watchOrders().listen((orders) {
      add(OrdersUpdated(orders));
    });
  }

  Future<void> _onOrderAdded(OrderAdded event, Emitter<OrderMonitorState> emit) async {
    final netProfit = ProfitCalculator.calculateNetProfit(event.revenue, event.distance);
    final order = OrderEntity(
      platform: event.platform,
      revenue: event.revenue,
      distance: event.distance,
      timestamp: DateTime.now(),
      netProfit: netProfit,
      targetDistrictId: event.districtId, // Sửa từ districtId thành targetDistrictId
    );
    await _orderRepository.saveOrder(order);
  }

  void _onOrdersUpdated(OrdersUpdated event, Emitter<OrderMonitorState> emit) {
    emit(OrderMonitorLoaded(event.orders.cast<OrderEntity>()));
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
