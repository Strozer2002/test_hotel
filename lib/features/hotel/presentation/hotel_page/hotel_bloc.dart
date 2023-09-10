import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_hotel/features/hotel/domain/models/hotel/about_hotel_entity.dart';
import 'package:test_hotel/features/hotel/domain/models/hotel/hotel_entity.dart';
import 'package:test_hotel/features/hotel/repository/hotel_repository.dart';

import '../../../../app_data/app_data.dart';
import 'hotel_page.dart';

abstract class HotelPageBloc extends State<HotelPage> {
  final HotelRepository hotelRepo = HotelRepository();

  HotelEntity? hotel;
  AboutHotelEntity? aboutHotel;

  void goRoom() =>
      context.push(AppData.routes.hotelRoomScreen, extra: hotel!.name);
  @override
  void initState() {
    super.initState();
    init();
  }

  FutureOr<void> init() async {
    final result = await hotelRepo.getHotel();
    if (result.isSuccess) {
      aboutHotel = AboutHotelEntity(
        description: result.data!.aboutHotel.description,
        peculiarities: result.data!.aboutHotel.peculiarities,
      );
      setState(() {
        hotel = HotelEntity(
          id: result.data!.id,
          name: result.data!.name,
          adress: result.data!.adress,
          minPrice: result.data!.minPrice,
          priceText: result.data!.priceText,
          rating: result.data!.rating,
          ratingName: result.data!.ratingName,
          imageUrl: result.data!.imageUrl,
          aboutHotel: aboutHotel!,
        );
      });
      print("result.data.name ${result.data?.name}");
    }
  }
}
