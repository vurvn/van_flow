import 'dart:convert';
import 'package:flutter/services.dart';
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
      
      // Inject districtId into the profile map before parsing
      final profileMap = Map<String, dynamic>.from(item['profile']);
      profileMap['districtId'] = district.districtId;
      
      return DistrictData(
        district: district,
        profile: DistrictProfile.fromJson(profileMap),
      );
    }).toList();
  }
}
