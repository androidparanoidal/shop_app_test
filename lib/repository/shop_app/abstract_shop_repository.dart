import 'package:shop_test/repository/shop_app/models/models.dart';

abstract class AbstractShopRepository {
  Future<ItemsList> getItemsList();
  Future<AData> getItemDetail();
}
