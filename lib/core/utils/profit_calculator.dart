import 'app_constants.dart';

class ProfitCalculator {
  static double calculateNetProfit(double revenue, double totalKm) {
    // Sử dụng chi phí vận hành từ AppConstants (3,500đ/km)
    double totalCost = totalKm * AppConstants.operatingCostPerKm;
    return revenue - totalCost;
  }

  static double calculateTotalCost(double totalKm) {
    return totalKm * AppConstants.operatingCostPerKm;
  }
}
