import 'package:flutter/material.dart';

import 'app_data/app_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppData.routesConfig.routerConfig,
      title: 'Flutter Demo',
      theme: AppData.theme.themeData(context),
    );
  }
}
