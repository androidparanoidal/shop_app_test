import 'package:flutter/cupertino.dart';
import 'package:shop_test/features/catalogue/view/catalogue_page.dart';
import 'package:shop_test/features/product/view/product_detail_page.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CatalogueRoute.page, path: '/'),
        AutoRoute(page: ProductDetailRoute.page),
      ];
}

// final routes = {
//   '/': (context) => const CataloguePage(),
//   '/product': (context) => const ProductDetailScreen(),
// };
