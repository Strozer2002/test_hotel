// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomListEntity _$RoomListEntityFromJson(Map<String, dynamic> json) =>
    RoomListEntity(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomListEntityToJson(RoomListEntity instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
    };
