// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomEntity _$RoomEntityFromJson(Map<String, dynamic> json) => RoomEntity(
      price: json['price'] as int,
      pricePer: json['price_per'] as String,
      peculiar: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomEntityToJson(RoomEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.pricePer,
      'peculiarities': instance.peculiar,
      'image_urls': instance.imageUrl,
    };
