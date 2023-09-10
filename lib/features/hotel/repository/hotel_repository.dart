import 'package:test_hotel/features/hotel/domain/models/hotel/hotel_entity.dart';
import 'package:test_hotel/features/hotel/domain/models/hotel_room/room_list.dart';
import 'package:test_hotel/features/hotel/domain/models/reservation/reservation.dart';

import '../../../core/data_source/dev_remote_data_source.dart';
import '../../../core/domain/object/general_callback_result.dart';
import 'hotel_client.dart';

final class HotelRepository extends DevRemoteDataSource {
  late final _client = HotelClient(dio);

  Future<RemoteCbResult<HotelEntity?>> getHotel() =>
      request(() => _client.getHotel());

  Future<RemoteCbResult<RoomListEntity?>> getRooms() =>
      request(() => _client.getRooms());

  Future<RemoteCbResult<ReservationEntity?>> getReservation() =>
      request(() => _client.getReservation());
}
