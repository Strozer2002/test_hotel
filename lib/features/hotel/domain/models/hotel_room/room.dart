// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class RoomEntity implements DTO {
  final int id;

  final String name;

  final int price;

  @JsonKey(name: "price_per")
  final String pricePer;

  @JsonKey(name: "peculiarities")
  final List<String> peculiar;

  @JsonKey(name: "image_urls")
  final List<String> imageUrl;

  const RoomEntity({
    required this.price,
    required this.pricePer,
    required this.peculiar,
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory RoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RoomEntityToJson(this);
}
