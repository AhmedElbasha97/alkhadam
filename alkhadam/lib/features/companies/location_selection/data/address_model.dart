/// Holds address details from location selection (street, building, floor, apartment).
class AddressModel {
  const AddressModel({
    this.streetName = '',
    this.buildingNumber = '',
    this.floorNumber = '',
    this.apartmentNumber = '',
    this.lat,
    this.lng,
  });

  final String streetName;
  final String buildingNumber;
  final String floorNumber;
  final String apartmentNumber;
  final double? lat;
  final double? lng;

  String get displayAddress {
    final parts = <String>[
      if (streetName.isNotEmpty) streetName,
      if (buildingNumber.isNotEmpty) 'Bldg. $buildingNumber',
      if (floorNumber.isNotEmpty) 'Floor $floorNumber',
      if (apartmentNumber.isNotEmpty) 'Apt. $apartmentNumber',
    ];
    return parts.isEmpty ? '' : parts.join(', ');
  }

  AddressModel copyWith({
    String? streetName,
    String? buildingNumber,
    String? floorNumber,
    String? apartmentNumber,
    double? lat,
    double? lng,
  }) {
    return AddressModel(
      streetName: streetName ?? this.streetName,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      floorNumber: floorNumber ?? this.floorNumber,
      apartmentNumber: apartmentNumber ?? this.apartmentNumber,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }
}
