import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../repository/shop_app/models/cart_item_model.dart';

class CartDatabaseProvider {
  CartDatabaseProvider._();
  static final CartDatabaseProvider db = CartDatabaseProvider._();

  static late Database _database;
  String tableName = 'ItemsCart';
  String columnId = 'id';
  String itemData = 'itemData';
  String amount = 'amount';

  Future<Database> get database async {
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}ShopCart.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $tableName($columnId TEXT PRIMARY KEY, $itemData TEXT, $amount INTEGER)',
    );
  }

  Future<List<CartItem>> getItems() async {
    Database db = await database;
    final List<Map<String, dynamic>> itemsMap = await db.query(tableName);
    int length = itemsMap.length;
    return List.generate(length, (index) {
      return CartItem.fromMap(itemsMap[index]);
    });
  }

  Future<void> addItem(CartItem item) async {
    final db = await database;
    await db.insert(tableName, item.toMap());
  }

  Future<void> removeItem(String id) async {
    final db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
