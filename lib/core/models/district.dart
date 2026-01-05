class District {
  final String districtId;
  final String districtName;
  final String city;

  District({
    required this.districtId,
    required this.districtName,
    required this.city,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      districtId: json['districtId'] as String,
      districtName: json['districtName'] as String,
      city: json['city'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'districtId': districtId,
      'districtName': districtName,
      'city': city,
    };
  }
}
