import 'package:equatable/equatable.dart';

abstract class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();

  @override
  List<Object?> get props => [];
}

class LoadAnalyticsStarted extends AnalyticsEvent {}

class AnalyticsUpdated extends AnalyticsEvent {
  final List<dynamic> orders;

  const AnalyticsUpdated(this.orders);

  @override
  List<Object?> get props => [orders];
}
