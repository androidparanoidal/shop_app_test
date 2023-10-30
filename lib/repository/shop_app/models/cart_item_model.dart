import 'package:shop_test/repository/shop_app/models/product_model.dart';

class CartItem {
  CartItem({
    required this.id,
    required this.itemData,
  });

  final String id;
  final AData itemData;

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'itemData': AData.fromJson(itemData as Map<String, dynamic>),
  //   };
  // }
  //
  // CartItem.fromMap(Map<String, dynamic> map, this.id, this.itemData) {}
}
