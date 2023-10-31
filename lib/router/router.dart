import 'package:flutter/cupertino.dart';
import 'package:shop_test/features/catalogue/view/catalogue_page.dart';
import 'package:shop_test/features/product/view/product_detail_page.dart';
import 'package:auto_route/auto_route.dart';

import '../features/cart/view/cart_page.dart';
import '../features/product/view/alert_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CatalogueRoute.page, path: '/'),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: AlertRoute.page),
        AutoRoute(page: CartRoute.page),
      ];
}
