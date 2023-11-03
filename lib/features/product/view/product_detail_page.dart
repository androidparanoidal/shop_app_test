import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repository/shop_app/abstract_shop_repository.dart';
import '../../../router/router.dart';
import '../../../theme/app_colors.dart';
import '../bloc/product_detail_bloc.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _productDetailBloc =
      ProductDetailBloc(GetIt.I<AbstractShopRepository>());

  @override
  void initState() {
    _productDetailBloc.add(LoadProductDetails(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(CartRoute());
              },
              child: Container(
                width: 78,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: AppColors.darkColor),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 21,
                        fontFamily: 'OpenSans_Regular',
                      ),
                    ),
                    Icon(
                      Icons.shopping_bag_rounded,
                      color: AppColors.whiteColor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          bloc: _productDetailBloc,
          builder: (context, state) {
            if (state is ProductDetailLoaded) {
              final item = state.item;
              final productId = item.id;
              return ListView(
                children: [
                  Image.network(item.photos[0].big),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      item.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${item.price} руб.',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(AlertRoute(id: productId));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Добавить в корзину',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(item.descriptions.text),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
