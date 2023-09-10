// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelEntity _$HotelEntityFromJson(Map<String, dynamic> json) => HotelEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      adress: json['adress'] as String,
      minPrice: json['minimal_price'] as int,
      priceText: json['price_for_it'] as String,
      rating: json['rating'] as int,
      ratingName: json['rating_name'] as String,
      imageUrl: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      aboutHotel: AboutHotelEntity.fromJson(
          json['about_the_hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelEntityToJson(HotelEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'minimal_price': instance.minPrice,
      'price_for_it': instance.priceText,
      'rating': instance.rating,
      'rating_name': instance.ratingName,
      'image_urls': instance.imageUrl,
      'about_the_hotel': instance.aboutHotel,
    };
