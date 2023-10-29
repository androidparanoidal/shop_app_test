import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../repository/shop_app/abstract_shop_repository.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        bloc: _productDetailBloc,
        builder: (context, state) {
          if (state is ProductDetailLoaded) {
            final item = state.item;
            return Column(
              children: [
                Image.network(item.photos[0].big),
                Text(item.name),
                Text('${item.price} руб.'),
                Text(item.descriptions.text),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}
