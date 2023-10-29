import 'models/items_list_model.dart';
import 'models/product_model.dart';

abstract class AbstractShopRepository {
  Future<ItemsList> getItemsList();
  Future<AData> getItemDetail(int id);
}
