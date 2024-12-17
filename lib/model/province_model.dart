class ProvinceModel {
  final int proCode;
  final String nameEn;
  final String nameKh;
  final int active;

  ProvinceModel({
    required this.proCode,
    required this.nameEn,
    required this.nameKh,
    required this.active,
  });

  // A factory constructor for creating a Province instance from a map.
  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
      proCode: json['pro_code'],
      nameEn: json['name_en'],
      nameKh: json['name_kh'],
      active: json['active'],
    );
  }
}
