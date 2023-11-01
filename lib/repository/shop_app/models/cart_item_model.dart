import 'dart:convert';
import 'package:shop_test/repository/shop_app/models/product_model.dart';

class CartItem {
  CartItem({
    required this.id,
    required this.itemData,
    required this.amount,
  });

  final String id;
  final AData itemData;
  int amount;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemData': itemData,
      'amount': amount,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      itemData: AData.fromJson(jsonDecode(map['itemData'])),
      amount: map['amount'],
    );
  }
}
