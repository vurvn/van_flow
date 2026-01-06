class AppConstants {
  // --- Van Physicals & Costs ---
  static const double fuelPrice = 21000;       // VND/Lít (Giá xăng hiện tại)
  static const double kmPerLiter = 10.0;      // Định mức tiêu thụ
  static const double maintenancePerKm = 1150; // Khấu hao bảo dưỡng
  
  // Chi phí vận hành thực tế mỗi KM
  static double get operatingCostPerKm => (fuelPrice / kmPerLiter) + maintenancePerKm;

  // --- Scoring Engine Weights ---
  static const double scoreEmptyKmWeight = 9000;    // Trọng số trừ điểm cho mỗi KM chạy rỗng
  static const double scoreTrafficWeight = 3000;    // Trọng số trừ điểm cho mỗi phút kẹt xe
  static const double scoreChainProbWeight = 40000; // Trọng số cộng điểm cho xác suất nối đơn
  
  // Penalties
  static const double penaltyTimeRestricted = 5000;
  static const double penaltyVanUnfriendly = 10000;

  // Decision Thresholds
  static const double thresholdAccept = 40000;
  static const double thresholdConsider = 0;

  // --- Learning Engine Weights ---
  static const double learningRecencyWeight = 0.8; // Trọng số giữ lại dữ liệu cũ
  static const double learningNewDataWeight = 0.2; // Trọng số cập nhật dữ liệu mới
}
