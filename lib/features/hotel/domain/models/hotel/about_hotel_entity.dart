// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'about_hotel_entity.g.dart';

@JsonSerializable(createFactory: true)
class AboutHotelEntity implements DTO {
  final String description;

  final List<String> peculiarities;

  const AboutHotelEntity({
    required this.description,
    required this.peculiarities,
  });

  factory AboutHotelEntity.fromJson(Map<String, dynamic> json) =>
      _$AboutHotelEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AboutHotelEntityToJson(this);
}
