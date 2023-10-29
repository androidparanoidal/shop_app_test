import 'package:flutter/material.dart';
import 'package:shop_test/repository/shop_app/models/models.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              //Image.network(state.itemsList.aProduct[index].photos[0].big),
              Text('name'),
              Text('руб.'),
            ],
          ),
        ),
      ),
    );
  }
}
