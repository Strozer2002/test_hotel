import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_hotel/features/hotel/presentation/reservation/reservation_bloc.dart';
import 'package:test_hotel/features/hotel/presentation/widgets/custom_input.dart';
import 'package:test_hotel/features/hotel/presentation/widgets/statistic_hotel.dart';
import 'package:test_hotel/features/widgets/bottom_bar.dart';
import 'package:test_hotel/features/widgets/custom_card.dart';
import 'package:test_hotel/features/widgets/header_text.dart';

import '../../../../app_data/app_data.dart';
import '../widgets/tourist.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends ReservationBloc {
  AppBar get appBar {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: AppData.assets.svg.arrowBack(),
      ),
      title: const Text("Бронирование"),
      centerTitle: true,
    );
  }

  Widget row(String name, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget rowMoney(String name, String value, bool isBlue) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: isBlue == true ? Colors.blue : null,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: reservation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    CustomCard(
                      widget: StatisticHotel(
                        rating: reservation!.horating,
                        ratingName: reservation!.ratingName,
                        name: reservation!.hotelName,
                        adress: reservation!.hotelAddress,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomCard(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          row('Вылет из', reservation!.departure),
                          const SizedBox(height: 16),
                          row('Страна, город', reservation!.arrivalCountry),
                          const SizedBox(height: 16),
                          row(
                            'Даты',
                            '${reservation!.tourStart} - ${reservation!.tourStop}',
                          ),
                          const SizedBox(height: 16),
                          row(
                            'Кол-во ночей',
                            '${reservation!.numberNights} ночей',
                          ),
                          const SizedBox(height: 16),
                          row('Отель', reservation!.hotelName),
                          const SizedBox(height: 16),
                          row('Номер', reservation!.room),
                          const SizedBox(height: 16),
                          row('Питание', reservation!.nutrition),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomCard(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const HeaderText(text: "Информация о покупателе"),
                          const SizedBox(height: 16),
                          CustomInput(
                            keyboardType: TextInputType.phone,
                            label: 'Номер телефона',
                            keyForm: formKey,
                          ),
                          const SizedBox(height: 8),
                          CustomInput(
                            keyboardType: TextInputType.emailAddress,
                            label: 'Почта',
                            keyForm: formKey,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: touristCount,
                      itemBuilder: (context, index) => CustomCard(
                        widget: TouristWidget(
                          id: '${index + 1} турист',
                          keyForm: formKey,
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                    ),
                    const SizedBox(height: 8),
                    CustomCard(
                      widget: Column(
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Expanded(
                                child: HeaderText(text: "Добавить туриста "),
                              ),
                              IconButton(
                                style: AppData.theme.button.defaultIconButton,
                                onPressed: () {
                                  setState(() {
                                    touristCount = touristCount + 1;
                                  });
                                },
                                icon: const Icon(Icons.add, size: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomCard(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          rowMoney(
                            'Тур',
                            "${reservation!.tourPrice} ₽",
                            false,
                          ),
                          const SizedBox(height: 16),
                          rowMoney(
                            'Топливный сбор',
                            "${reservation!.fuelCharge} ₽",
                            false,
                          ),
                          const SizedBox(height: 16),
                          rowMoney(
                            'Сервисный сбор',
                            "${reservation!.serviceCharge} ₽",
                            false,
                          ),
                          const SizedBox(height: 16),
                          rowMoney(
                            'К оплате',
                            '${reservation!.tourPrice + reservation!.fuelCharge + reservation!.serviceCharge} ₽',
                            true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: reservation != null
          ? CustomBottomBar(
              onPress: () {
                if (formKey.currentState!.validate()) {
                  context.push(AppData.routes.endScreen);
                }
              },
              child: Text(
                'Оплатить ${reservation!.tourPrice + reservation!.fuelCharge + reservation!.serviceCharge} ₽',
              ),
            )
          : null,
    );
  }
}
