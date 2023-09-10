// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_hotel/features/hotel/domain/models/hotel/about_hotel_entity.dart';

part 'hotel_entity.g.dart';

@JsonSerializable(createFactory: true)
class HotelEntity implements DTO {
  final int id;

  final String name;

  final String adress;

  @JsonKey(name: "minimal_price")
  final int minPrice;

  @JsonKey(name: "price_for_it")
  final String priceText;

  final int rating;

  @JsonKey(name: "rating_name")
  final String ratingName;

  @JsonKey(name: "image_urls")
  final List<String> imageUrl;

  @JsonKey(name: "about_the_hotel")
  final AboutHotelEntity aboutHotel;

  const HotelEntity({
    required this.id,
    required this.name,
    required this.adress,
    required this.minPrice,
    required this.priceText,
    required this.rating,
    required this.ratingName,
    required this.imageUrl,
    required this.aboutHotel,
  });

  factory HotelEntity.fromJson(Map<String, dynamic> json) =>
      _$HotelEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$HotelEntityToJson(this);
}
