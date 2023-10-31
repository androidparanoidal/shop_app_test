import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseProvider {
  CartDatabaseProvider._();
  static final CartDatabaseProvider db = CartDatabaseProvider._();

  static late Database _database;
  String tableName = 'ItemsCart';
  String columnId = 'id';
  String itemData = 'itemData';

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
      'CREATE TABLE $tableName($columnId TEXT PRIMARY KEY, $itemData TEXT)',
    );
  }
}
