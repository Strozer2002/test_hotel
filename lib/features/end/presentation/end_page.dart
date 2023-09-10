import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_hotel/features/end/presentation/end_bloc.dart';
import 'package:test_hotel/features/widgets/bottom_bar.dart';
import 'package:test_hotel/features/widgets/header_text.dart';

import '../../../app_data/app_data.dart';

class EndPage extends StatefulWidget {
  const EndPage({super.key});

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends EndBloc {
  AppBar get appBar {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: AppData.assets.svg.arrowBack(),
      ),
      title: const Text("Заказ оплачен"),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 44,
              child: AppData.assets.image.party(),
            ),
            const SizedBox(height: 32),
            const HeaderText(text: 'Ваш заказ принят в работу'),
            const SizedBox(height: 20),
            const Text(
              'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onPress: () => context.go(AppData.routes.hotelScreen),
        child: const Text("Супер!"),
      ),
    );
  }
}
