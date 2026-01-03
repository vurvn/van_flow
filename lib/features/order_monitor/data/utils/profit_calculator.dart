class ProfitCalculator {
  static double calculateNetProfit(double revenue, double distance) {
    // NetProfit = Revenue − (Distance × 3500)
    return revenue - (distance * 3500);
  }
}
