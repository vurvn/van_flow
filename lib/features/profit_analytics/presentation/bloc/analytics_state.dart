import 'package:equatable/equatable.dart';

import '../../../../core/models/income_summary.dart';

abstract class AnalyticsState extends Equatable {
  const AnalyticsState();

  @override
  List<Object?> get props => [];
}

class AnalyticsInitial extends AnalyticsState {}

class AnalyticsLoading extends AnalyticsState {}

class AnalyticsLoaded extends AnalyticsState {
  final IncomeSummary summary;

  const AnalyticsLoaded(this.summary);

  @override
  List<Object?> get props => [summary];
}
