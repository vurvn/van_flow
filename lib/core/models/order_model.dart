import 'package:isar/isar.dart';

part 'order_model.g.dart';

@collection
class OrderModel {
  Id id = Isar.autoIncrement;

  late String platform;
  late double revenue;
  late double distance;
  late DateTime timestamp;
  late double netProfit;
  
  // Start District
  String? startDistrictId;
  String? startDistrictName;

  // Target District
  String? targetDistrictId;
  String? targetDistrictName;

  bool? wasChained;
  double? durationHours;
  bool isCompleted = false;
}
