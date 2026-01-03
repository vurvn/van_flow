import 'package:equatable/equatable.dart';

class OrderState extends Equatable {
  final double totalNetProfit;
  final bool isMonitoring;

  const OrderState({
    this.totalNetProfit = 0.0,
    this.isMonitoring = false,
  });

  OrderState copyWith({
    double? totalNetProfit,
    bool? isMonitoring,
  }) {
    return OrderState(
      totalNetProfit: totalNetProfit ?? this.totalNetProfit,
      isMonitoring: isMonitoring ?? this.isMonitoring,
    );
  }

  @override
  List<Object?> get props => [totalNetProfit, isMonitoring];
}
