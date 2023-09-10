import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_hotel/core/domain/object/single_response_body.dart';
import 'package:test_hotel/features/hotel/domain/models/hotel/hotel_entity.dart';
import 'package:test_hotel/features/hotel/domain/models/hotel_room/room_list.dart';
import 'package:test_hotel/features/hotel/domain/models/reservation/reservation.dart';

part 'hotel_client.g.dart';

@RestApi()
abstract class HotelClient {
  factory HotelClient(Dio dio, {String? baseUrl}) = _HotelClient;

  @GET('/35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<HttpResponse<SingleResponseBody<HotelEntity>>> getHotel();

  @GET('/f9a38183-6f95-43aa-853a-9c83cbb05ecd')
  Future<HttpResponse<SingleResponseBody<RoomListEntity>>> getRooms();

  @GET('/e8868481-743f-4eb2-a0d7-2bc4012275c8')
  Future<HttpResponse<SingleResponseBody<ReservationEntity>>> getReservation();
}
