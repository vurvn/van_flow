import 'package:isar/isar.dart';
import '../models/district_profile.dart';
import '../models/order_model.dart';
import '../utils/profit_calculator.dart';

class AnalyticsService {
  final Isar isar;

  AnalyticsService(this.isar);

  Future<void> recordOrderExecution({
    int? orderId,
    required String districtId,
    required double revenue,
    required double distance,
    required double durationHours,
    required bool wasChained,
  }) async {
    await isar.writeTxn(() async {
      // 1. Cập nhật Analytics của Hồ sơ Quận/Huyện
      final profile = await isar.districtProfiles.filter()
          .districtIdEqualTo(districtId)
          .findFirst();

      if (profile != null) {
        // Cập nhật xác suất nối đơn (Chain Probability)
        profile.chainProbability = (profile.chainProbability * 0.8) + (wasChained ? 0.2 : 0);
        
        // Cập nhật tổng số liệu
        profile.totalIncome += revenue;
        profile.totalKm += distance;
        profile.totalHours += durationHours;
        profile.orderCount += 1;
        profile.avgIncomePerKm = profile.totalIncome / (profile.totalKm > 0 ? profile.totalKm : 1);
        
        await isar.districtProfiles.put(profile);
      }

      // 2. Ghi nhận hoặc Cập nhật đơn hàng
      OrderModel orderRecord;
      if (orderId != null) {
        final existing = await isar.orderModels.get(orderId);
        if (existing != null) {
          orderRecord = existing;
        } else {
          orderRecord = OrderModel()..platform = "Thủ công";
        }
      } else {
        orderRecord = OrderModel()..platform = "Thủ công";
      }

      orderRecord
        ..revenue = revenue
        ..distance = distance
        ..timestamp = DateTime.now()
        ..netProfit = ProfitCalculator.calculateNetProfit(revenue, distance)
        ..districtId = districtId
        ..wasChained = wasChained
        ..durationHours = durationHours
        ..isCompleted = true; 
      
      await isar.orderModels.put(orderRecord);
    });
  }
}
