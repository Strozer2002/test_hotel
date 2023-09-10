// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_hotel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutHotelEntity _$AboutHotelEntityFromJson(Map<String, dynamic> json) =>
    AboutHotelEntity(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutHotelEntityToJson(AboutHotelEntity instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
