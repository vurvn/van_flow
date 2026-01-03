import 'package:equatable/equatable.dart';

class IncomeSummary extends Equatable {
  final double totalRevenue;
  final double totalNetProfit;
  final Map<DateTime, double> dailyProfits;

  const IncomeSummary({
    required this.totalRevenue,
    required this.totalNetProfit,
    required this.dailyProfits,
  });

  @override
  List<Object?> get props => [totalRevenue, totalNetProfit, dailyProfits];
}
