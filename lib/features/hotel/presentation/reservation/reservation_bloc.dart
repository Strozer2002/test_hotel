import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:test_hotel/features/hotel/domain/models/reservation/reservation.dart';
import 'package:test_hotel/features/hotel/presentation/reservation/reservation_page.dart';

import '../../../../app_data/app_data.dart';
import '../../repository/hotel_repository.dart';

abstract class ReservationBloc extends State<ReservationPage> {
  final HotelRepository hotelRepo = HotelRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ReservationEntity? reservation;
  int touristCount = 1;
  @override
  void initState() {
    super.initState();
    init();
  }

  void goReserv() => context.push(AppData.routes.reservationScreen);

  FutureOr<void> init() async {
    final result = await hotelRepo.getReservation();
    if (result.isSuccess) {
      setState(() {
        reservation = ReservationEntity(
          id: result.data!.id,
          hotelName: result.data!.hotelName,
          hotelAddress: result.data!.hotelAddress,
          horating: result.data!.horating,
          ratingName: result.data!.ratingName,
          departure: result.data!.departure,
          arrivalCountry: result.data!.arrivalCountry,
          tourStart: result.data!.tourStart,
          tourStop: result.data!.tourStop,
          numberNights: result.data!.numberNights,
          room: result.data!.room,
          nutrition: result.data!.nutrition,
          tourPrice: result.data!.tourPrice,
          fuelCharge: result.data!.fuelCharge,
          serviceCharge: result.data!.serviceCharge,
        );
      });
    }
  }
}
