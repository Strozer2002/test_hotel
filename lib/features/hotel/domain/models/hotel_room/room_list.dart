// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_hotel/features/hotel/domain/models/hotel_room/room.dart';

part 'room_list.g.dart';

@JsonSerializable(createFactory: true)
class RoomListEntity implements DTO {
  final List<RoomEntity> rooms;

  const RoomListEntity({
    required this.rooms,
  });

  factory RoomListEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomListEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RoomListEntityToJson(this);
}
