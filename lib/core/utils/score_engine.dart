import '../models/district_profile.dart';

enum Decision { accept, consider, reject }

class OrderInput {
  final double fee;
  final double emptyKm;
  final double trafficMinutes;

  OrderInput({
    required this.fee,
    required this.emptyKm,
    required this.trafficMinutes,
  });
}

class ScoreEngine {
  static double calculateScore(OrderInput order, DistrictProfile districtProfile) {
    // Score = Fee
    //       - (EmptyKm * 9000)
    //       - (TrafficMinutes * 3000)
    //       + (district.chainProbability * 40000)
    //       - (district penalties/restrictions)
    
    double penalties = districtProfile.hasTimeRestriction ? 5000 : 0;
    if (!districtProfile.isVanFriendly) penalties += 10000;

    return order.fee -
        (order.emptyKm * 9000) -
        (order.trafficMinutes * 3000) +
        (districtProfile.chainProbability * 40000) -
        penalties;
  }

  static Decision decisionFromScore(double score) {
    if (score >= 40000) {
      return Decision.accept;
    } else if (score >= 0) {
      return Decision.consider;
    } else {
      return Decision.reject;
    }
  }
}
