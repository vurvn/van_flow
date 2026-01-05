import 'package:isar/isar.dart';

part 'district_profile.g.dart';

@collection
class DistrictProfile {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String districtId;
  
  late double chainProbability;
  late double avgIncomePerKm;
  late int avgWaitingMinutes;
  late bool isVanFriendly;
  late bool hasTimeRestriction;

  // New analytics fields
  double totalIncome = 0;
  double totalKm = 0;
  double totalHours = 0;
  int orderCount = 0;

  DistrictProfile();

  factory DistrictProfile.fromJson(Map<String, dynamic> json) {
    return DistrictProfile()
      ..districtId = (json['districtId'] as String? ?? "") // Handle null if called with nested 'profile' object
      ..chainProbability = (json['chainProbability'] as num? ?? 0.0).toDouble()
      ..avgIncomePerKm = (json['avgIncomePerKm'] as num? ?? 0.0).toDouble()
      ..avgWaitingMinutes = json['avgWaitingMinutes'] as int? ?? 0
      ..isVanFriendly = json['isVanFriendly'] as bool? ?? true
      ..hasTimeRestriction = json['hasTimeRestriction'] as bool? ?? false;
  }

  Map<String, dynamic> toJson() {
    return {
      'districtId': districtId,
      'chainProbability': chainProbability,
      'avgIncomePerKm': avgIncomePerKm,
      'avgWaitingMinutes': avgWaitingMinutes,
      'isVanFriendly': isVanFriendly,
      'hasTimeRestriction': hasTimeRestriction,
    };
  }
}
