import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shop_test/repository/shop_app/abstract_shop_repository.dart';
import 'package:shop_test/repository/shop_app/shop_app_repository.dart';
import 'package:shop_test/router/router.dart';
import 'package:shop_test/theme/theme.dart';

void main() {
  GetIt.instance.registerLazySingleton<AbstractShopRepository>(
      () => ShopAppRepository(client: http.Client()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      //theme: lightTheme,
      routes: routes,
    );
  }
}
