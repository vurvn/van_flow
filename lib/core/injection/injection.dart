import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/order_monitor/data/repositories/order_repository_impl.dart';
import '../../features/order_monitor/domain/repositories/order_repository.dart';
import '../../features/order_monitor/presentation/bloc/order_monitor_bloc.dart';
import '../../features/profit_analytics/presentation/bloc/analytics_bloc.dart';
import '../models/order_model.dart';
import '../models/district_profile.dart';
import '../services/analytics_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [OrderModelSchema, DistrictProfileSchema],
    directory: dir.path,
  );
  sl.registerLazySingleton(() => isar);

  // Services
  sl.registerLazySingleton(() => AnalyticsService(sl()));

  // Repository
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(sl()),
  );

  // Blocs
  sl.registerFactory(
    () => OrderMonitorBloc(orderRepository: sl()),
  );
  sl.registerFactory(
    () => AnalyticsBloc(orderRepository: sl()),
  );
}
