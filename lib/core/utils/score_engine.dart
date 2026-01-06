import '../models/district_profile.dart';
import 'app_constants.dart';

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
    double penalties = districtProfile.hasTimeRestriction 
        ? AppConstants.penaltyTimeRestricted 
        : 0;
        
    if (!districtProfile.isVanFriendly) {
      penalties += AppConstants.penaltyVanUnfriendly;
    }

    return order.fee -
        (order.emptyKm * AppConstants.scoreEmptyKmWeight) -
        (order.trafficMinutes * AppConstants.scoreTrafficWeight) +
        (districtProfile.chainProbability * AppConstants.scoreChainProbWeight) -
        penalties;
  }

  static Decision decisionFromScore(double score) {
    if (score >= AppConstants.thresholdAccept) {
      return Decision.accept;
    } else if (score >= AppConstants.thresholdConsider) {
      return Decision.consider;
    } else {
      return Decision.reject;
    }
  }
}
