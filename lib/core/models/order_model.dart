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
  
  // Link to district for analytics
  String? districtId;
  bool? wasChained;
  double? durationHours;
}
