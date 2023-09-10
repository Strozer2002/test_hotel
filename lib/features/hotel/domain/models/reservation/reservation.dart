import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation.g.dart';

@JsonSerializable(createFactory: true)
class ReservationEntity implements DTO {
  final int id;
  @JsonKey(name: "hotel_name")
  final String hotelName;
  @JsonKey(name: "hotel_adress")
  final String hotelAddress;
  final int horating;
  @JsonKey(name: "rating_name")
  final String ratingName;
  final String departure;
  @JsonKey(name: "arrival_country")
  final String arrivalCountry;
  @JsonKey(name: "tour_date_start")
  final String tourStart;
  @JsonKey(name: "tour_date_stop")
  final String tourStop;
  @JsonKey(name: "number_of_nights")
  final int numberNights;
  final String room;
  final String nutrition;
  @JsonKey(name: "tour_price")
  final int tourPrice;
  @JsonKey(name: "fuel_charge")
  final int fuelCharge;
  @JsonKey(name: "service_charge")
  final int serviceCharge;

  const ReservationEntity({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourStart,
    required this.tourStop,
    required this.numberNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  factory ReservationEntity.fromJson(Map<String, dynamic> json) =>
      _$ReservationEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ReservationEntityToJson(this);
}
