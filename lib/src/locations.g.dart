// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) {
  return LatLng(
    latitude:double.parse(json['latitude']),
    longitude: double.parse(json['longitude']),
  );
}

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return Office(
    id: json['id'],
    latitude:double.parse(json['latitude']),
    longitude: double.parse(json['longitude']),
    campus: json['campus'],
    phone: json['phone'],
  );
}

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
  'id': instance.id,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'campus': instance.campus,
  'phone': instance.phone,
};

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
    offices: (json['offices'] as List)
        .map((e) =>
    e == null ? null : Office.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
  'offices': instance.offices,
};
