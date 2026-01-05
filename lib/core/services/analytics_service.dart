import 'package:isar/isar.dart';
import '../models/district_profile.dart';
import '../models/order_model.dart';
class AnalyticsService {
  final Isar isar;

  AnalyticsService(this.isar);

  Future<void> recordOrderExecution({
    required String districtId,
    required double revenue,
    required double distance,
    required double durationHours,
    required bool wasChained,
  }) async {
    await isar.writeTxn(() async {
      // 1. Update District Profile Analytics
      final profile = await isar.districtProfiles.filter()
          .districtIdEqualTo(districtId)
          .findFirst();

      if (profile != null) {
        // Update Chain Probability: new = old * 0.8 + (result ? 0.2 : 0)
        profile.chainProbability = (profile.chainProbability * 0.8) + (wasChained ? 0.2 : 0);
        
        // Update Running Totals
        profile.totalIncome += revenue;
        profile.totalKm += distance;
        profile.totalHours += durationHours;
        profile.orderCount += 1;

        // Update derived averages
        profile.avgIncomePerKm = profile.totalIncome / (profile.totalKm > 0 ? profile.totalKm : 1);
        
        await isar.districtProfiles.put(profile);
      }

      // 2. Persist the order record for historical analysis
      final orderRecord = OrderModel()
        ..platform = "Manual"
        ..revenue = revenue
        ..distance = distance
        ..timestamp = DateTime.now()
        ..netProfit = revenue - (distance * 3500)
        ..districtId = districtId
        ..wasChained = wasChained
        ..durationHours = durationHours;
      
      await isar.orderModels.put(orderRecord);
    });
  }
}
