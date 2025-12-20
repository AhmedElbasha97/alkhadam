class CompanyDetailsModel {
  final bool success;
  final String message;
  final CompanyData data;

  CompanyDetailsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CompanyDetailsModel.fromJson(Map<String, dynamic> json) {
    return CompanyDetailsModel(
      success: json['success'],
      message: json['message'],
      data: CompanyData.fromJson(json['data']),
    );
  }
}

class CompanyData {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final String tel;
  final String whatsapp;
  final String address;
  final String location;
  final String image;
  final String? image2;
  final String? image3;
  final String thumb;

  /// 🔥 FIXED → Convert images into a list for the carousel
  final List<String> images;

  final Country country;
  final CompanyType type;

  CompanyData({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.tel,
    required this.whatsapp,
    required this.address,
    required this.location,
    required this.image,
    required this.image2,
    required this.image3,
    required this.thumb,
    required this.images,
    required this.country,
    required this.type,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    /// ⭐ Combine images manually into a list
    List<String> imgs = [];

    if (json['image'] != null) imgs.add(json['image']);
    if (json['image2'] != null && json['image2'] != "") imgs.add(json['image2']);
    if (json['image3'] != null && json['image3'] != "") imgs.add(json['image3']);

    return CompanyData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      tel: json['tel'],
      whatsapp: json['whatsapp'],
      address: json['address'],
      location: json['location'] ?? '',
      image: json['image'],
      image2: json['image2'],
      image3: json['image3'],
      thumb: json['thumb'],
      images: imgs, // 🔥 FIXED
      country: Country.fromJson(json['country']),
      type: CompanyType.fromJson(json['type']),
    );
  }
}

class Country {
  final int id;
  final String name;

  Country({required this.id, required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
    );
  }
}

class CompanyType {
  final int id;
  final String name;

  CompanyType({required this.id, required this.name});

  factory CompanyType.fromJson(Map<String, dynamic> json) {
    return CompanyType(
      id: json['id'],
      name: json['name'],
    );
  }
}
