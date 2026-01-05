import 'package:equatable/equatable.dart';
import '../../../../core/models/order_entity.dart';

abstract class OrderMonitorState extends Equatable {
  const OrderMonitorState();

  @override
  List<Object?> get props => [];
}

class OrderMonitorInitial extends OrderMonitorState {}

class OrderMonitorLoading extends OrderMonitorState {}

class OrderMonitorLoaded extends OrderMonitorState {
  final List<OrderEntity> orders;

  const OrderMonitorLoaded(this.orders);

  @override
  List<Object?> get props => [orders];
}

class OrderMonitorError extends OrderMonitorState {
  final String message;

  const OrderMonitorError(this.message);

  @override
  List<Object?> get props => [message];
}
