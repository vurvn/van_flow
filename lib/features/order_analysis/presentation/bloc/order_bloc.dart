import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../../data/utils/profit_calculator.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;
  StreamSubscription? _ordersSubscription;

  OrderBloc({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(const OrderState()) {
    on<StartMonitoring>(_onStartMonitoring);
    on<OnNewOrderCaptured>(_onOnNewOrderCaptured);
    on<OrdersUpdated>(_onOrdersUpdated);
  }

  void _onStartMonitoring(StartMonitoring event, Emitter<OrderState> emit) {
    emit(state.copyWith(isMonitoring: true));
    
    _ordersSubscription?.cancel();
    _ordersSubscription = _orderRepository.watchOrders().listen((orders) {
      final totalProfit = orders.fold(0.0, (sum, order) => sum + order.netProfit);
      add(OrdersUpdated(totalProfit));
    });
  }

  Future<void> _onOnNewOrderCaptured(
      OnNewOrderCaptured event, Emitter<OrderState> emit) async {
    final netProfit = ProfitCalculator.calculateNetProfit(event.price, event.distance);
    
    final order = OrderEntity(
      platform: "Captured",
      revenue: event.price,
      distance: event.distance,
      timestamp: DateTime.now(),
      netProfit: netProfit,
    );

    await _orderRepository.saveOrder(order);
  }

  void _onOrdersUpdated(OrdersUpdated event, Emitter<OrderState> emit) {
    emit(state.copyWith(totalNetProfit: event.totalNetProfit));
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
