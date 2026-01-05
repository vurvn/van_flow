class ProfitCalculator {
  static double calculateNetProfit(double revenue, double distance) {
    // NetProfit = Revenue − (Distance × 20000)
    return revenue - (distance * 20000);
  }
}
