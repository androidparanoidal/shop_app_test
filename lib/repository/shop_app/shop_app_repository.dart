import 'dart:convert';
import 'package:http/http.dart' as http;
import 'repository_main.dart';

class ShopAppRepository implements AbstractShopRepository {
  ShopAppRepository({required this.client});
  final http.Client client;

  @override
  Future<ItemsList> getItemsList() async {
    final queryParameters = {
      'shop': '2',
      'lang': '1',
      'category': 'dresses', // new dresses shoes last
      'limit': '12',
      'page': '1'
    };
    final uri = Uri.https('api.lichi.com',
        '/category/get_category_product_list', queryParameters);
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final items = data['api_data'];
      ItemsList itemsList = ItemsList.fromJson(items);
      return itemsList;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  @override
  Future<AData> getItemDetail() async {
    // (int id)
    final queryParameters = {
      'shop': '2',
      'lang': '1',
      'id': '46235' //id, //46235
    };

    final uri = Uri.https(
        'api.lichi.com', '/product/get_product_detail', queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final productInfo = data['api_data']; //aData
      print(productInfo);
      AData productDetail = AData.fromJson(productInfo);
      print(productDetail);
      return productDetail;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
