import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_hotel/features/end/presentation/end_page.dart';
import 'package:test_hotel/features/hotel/presentation/hotel_page/hotel_page.dart';
import 'package:test_hotel/features/hotel/presentation/hotel_room/hotel_room.dart';
import 'package:test_hotel/features/hotel/presentation/reservation/reservation_page.dart';

import '../app_data.dart';

final _routes = RoutesList();

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigator = GlobalKey(debugLabel: 'shell');

class RoutesList {
  // Registration

  String get hotelScreenName => 'hotelScreen';
  String get hotelScreen => '/$hotelScreenName';

  String get hotelRoomScreenName => 'hotelRoom';
  String get hotelRoomScreen => '$hotelScreen/$hotelRoomScreenName';

  String get reservationScreenName => 'reservation';
  String get reservationScreen => '$hotelRoomScreen/$reservationScreenName';

  String get endScreenName => 'end';
  String get endScreen => '$reservationScreen/$endScreenName';
}

class Routes {
  Routes();

  late final GoRouter routerConfig = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: AppData.routes.hotelScreen,
    routes: [
      GoRoute(
        path: AppData.routes.hotelScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HotelPage();
        },
        routes: [
          GoRoute(
            path: AppData.routes.hotelRoomScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return HotelRoom(name: state.extra as String);
            },
            routes: [
              GoRoute(
                path: AppData.routes.reservationScreenName,
                builder: (BuildContext context, GoRouterState state) {
                  return const ReservationPage();
                },
                routes: [
                  GoRoute(
                    path: AppData.routes.endScreenName,
                    builder: (BuildContext context, GoRouterState state) {
                      return const EndPage();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
