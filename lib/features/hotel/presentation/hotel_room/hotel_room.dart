import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_hotel/app_data/app_data.dart';
import 'package:test_hotel/features/hotel/presentation/widgets/carusel.dart';
import 'package:test_hotel/features/widgets/category_list.dart';
import 'package:test_hotel/features/widgets/custom_card.dart';
import 'package:test_hotel/features/widgets/header_text.dart';

import 'hotel_bloc.dart';

class HotelRoom extends StatefulWidget {
  final String name;
  const HotelRoom({
    super.key,
    required this.name,
  });

  @override
  State<HotelRoom> createState() => _HotelRoomState();
}

class _HotelRoomState extends HotelRoomBloc {
  AppBar get appBar {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: AppData.assets.svg.arrowBack(),
      ),
      title: Text(widget.name),
      centerTitle: true,
    );
  }

  Widget? card(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: CustomCard(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            CaruselWidget(imageUrl: rooms!.rooms[index].imageUrl),
            const SizedBox(height: 8),
            HeaderText(text: rooms!.rooms[index].name),
            const SizedBox(height: 8),
            CategoryList(object: rooms!.rooms[index].peculiar),
            const SizedBox(height: 8),
            FittedBox(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Text(
                      "Подробнее о номере",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppData.colors.sky200,
                      ),
                    ),
                    AppData.assets.svg.icons(
                      color: AppData.colors.sky200,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "${AppData.utils.formatNumber(rooms!.rooms[index].price)} ₽ ",
                  ),
                  TextSpan(
                    text: rooms!.rooms[index].pricePer,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: goReserv,
                child: const Text('Выбрать номер'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: rooms == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: card,
              itemCount: rooms!.rooms.length,
            ),
    );
  }
}
