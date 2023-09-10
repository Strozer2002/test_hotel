import 'package:flutter/material.dart';
import 'package:test_hotel/app_data/app_data.dart';
import 'package:test_hotel/features/hotel/presentation/hotel_page/hotel_bloc.dart';
import 'package:test_hotel/features/hotel/presentation/widgets/carusel.dart';
import 'package:test_hotel/features/hotel/presentation/widgets/statistic_hotel.dart';
import 'package:test_hotel/features/widgets/bottom_bar.dart';
import 'package:test_hotel/features/widgets/category_list.dart';
import 'package:test_hotel/features/widgets/custom_card.dart';
import 'package:test_hotel/features/widgets/header_text.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends HotelPageBloc {
  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "Отель",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget get header {
    return CustomCard(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CaruselWidget(imageUrl: hotel!.imageUrl),
          StatisticHotel(
            rating: hotel!.rating,
            ratingName: hotel!.ratingName,
            name: hotel!.name,
            adress: hotel!.adress,
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
                  text: "от ${AppData.utils.formatNumber(hotel!.minPrice)} ₽ ",
                ),
                TextSpan(
                  text: hotel!.priceText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get footer {
    return CustomCard(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const HeaderText(text: "Об отеле"),
          const SizedBox(height: 16),
          CategoryList(object: hotel!.aboutHotel.peculiarities),
          const SizedBox(height: 12),
          Text(
            hotel!.aboutHotel.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    AppData.assets.svg.emojiHappy(),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Удобства",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Самое необходимое",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppData.assets.svg.icons(),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    AppData.assets.svg.tickSquare(),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Что включено",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Самое необходимое",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppData.assets.svg.icons(),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    AppData.assets.svg.closeSquare(),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Что не включено",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Самое необходимое",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppData.assets.svg.icons(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: hotel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  header,
                  const SizedBox(height: 8),
                  footer,
                  const SizedBox(height: 12),
                ],
              ),
            ),
      bottomNavigationBar: CustomBottomBar(
        onPress: goRoom,
        child: const Text("К выбору номера"),
      ),
    );
  }
}
