import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:test_hotel/features/hotel/domain/models/hotel_room/room_list.dart';
import 'package:test_hotel/features/hotel/repository/hotel_repository.dart';

import '../../../../app_data/app_data.dart';
import 'hotel_room.dart';

abstract class HotelRoomBloc extends State<HotelRoom> {
  final HotelRepository hotelRepo = HotelRepository();
  RoomListEntity? rooms;

  @override
  void initState() {
    super.initState();
    init();
  }

  void goReserv() => context.push(AppData.routes.reservationScreen);

  FutureOr<void> init() async {
    final result = await hotelRepo.getRooms();
    if (result.isSuccess) {
      setState(() {
        rooms = RoomListEntity(rooms: result.data!.rooms);
      });
      print("result.data.name ${result.data?.rooms[0].name}");
    }
  }
}
