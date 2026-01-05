import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/order_entity.dart';
import '../../../../core/models/order_mappers.dart';
import '../../../../core/models/income_summary.dart';
import '../../../order_monitor/domain/repositories/order_repository.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final OrderRepository _orderRepository;
  StreamSubscription? _ordersSubscription;

  AnalyticsBloc({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(AnalyticsInitial()) {
    on<LoadAnalyticsStarted>(_onLoadAnalyticsStarted);
    on<AnalyticsUpdated>(_onAnalyticsUpdated);
  }

  void _onLoadAnalyticsStarted(LoadAnalyticsStarted event, Emitter<AnalyticsState> emit) {
    emit(AnalyticsLoading());
    _ordersSubscription?.cancel();
    _ordersSubscription = _orderRepository.watchOrders().listen((orders) {
      add(AnalyticsUpdated(orders));
    });
  }

  void _onAnalyticsUpdated(AnalyticsUpdated event, Emitter<AnalyticsState> emit) {
    final orders = event.orders.cast<OrderEntity>();
    
    double totalRevenue = 0;
    double totalNetProfit = 0;
    Map<DateTime, double> dailyProfits = {};

    for (var order in orders) {
      totalRevenue += order.revenue;
      totalNetProfit += order.netProfit;
      
      final date = DateTime(order.timestamp.year, order.timestamp.month, order.timestamp.day);
      dailyProfits[date] = (dailyProfits[date] ?? 0) + order.netProfit;
    }

    final summary = IncomeSummary(
      totalRevenue: totalRevenue,
      totalNetProfit: totalNetProfit,
      dailyProfits: dailyProfits,
    );

    emit(AnalyticsLoaded(summary));
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
