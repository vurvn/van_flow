import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import '../models/district.dart';
import '../models/district_profile.dart';

class DistrictData {
  final District district;
  final DistrictProfile profile;

  DistrictData({required this.district, required this.profile});
}

class DistrictService {
  static Future<List<DistrictData>> loadDistricts() async {
    final String response = await rootBundle.loadString('assets/data/districts.json');
    final List<dynamic> data = json.decode(response);
    
    return data.map((item) {
      final district = District.fromJson(item);
      final profileMap = Map<String, dynamic>.from(item['profile']);
      profileMap['districtId'] = district.districtId;
      
      return DistrictData(
        district: district,
        profile: DistrictProfile.fromJson(profileMap),
      );
    }).toList();
  }

  /// Lưu dữ liệu từ JSON vào Isar nếu DB trống
  static Future<void> seedDistricts(Isar isar) async {
    final count = await isar.districtProfiles.count();
    if (count == 0) {
      final districtsData = await loadDistricts();
      final profiles = districtsData.map((d) => d.profile).toList();
      await isar.writeTxn(() async {
        await isar.districtProfiles.putAll(profiles);
      });
    }
  }
}
