import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repository/shop_app/abstract_shop_repository.dart';
import '../../../router/router.dart';
import '../../../theme/app_colors.dart';
import '../bloc/product_detail_bloc.dart';

@RoutePage()
class AlertScreen extends StatefulWidget {
  const AlertScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
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
      body: SafeArea(
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          bloc: _productDetailBloc,
          builder: (context, state) {
            if (state is ProductDetailLoaded) {
              final item = state.item;
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text('Добавлено в корзину'),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        item.photos[0].big,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Text(item.name),
                    const SizedBox(height: 10),
                    const Text('Размер XS'),
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(CartRoute());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          height: 65,
                          decoration: BoxDecoration(
                              color: AppColors.darkColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Перейти в корзину',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: const Text(
                        'Закрыть',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
