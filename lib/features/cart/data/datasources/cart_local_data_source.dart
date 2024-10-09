import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/cart_item_model.dart';

class CartLocalDataSource {
  static final CartLocalDataSource _instance = CartLocalDataSource._internal();
  factory CartLocalDataSource() => _instance;
  CartLocalDataSource._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'cart_items.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cart_items(id INTEGER PRIMARY KEY, userId INTEGER, date TEXT, products TEXT)',
        );
      },
    );
  }

  Future<void> insertCartItem(CartItemModel cartItem) async {
    final db = await database;
    await db.insert(
      'cart_items',
      cartItem.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteCartItem(int cartItemId) async {
    final db = await database;
    await db.delete(
      'cart_items',
      where: 'id = ?',
      whereArgs: [cartItemId],
    );
  }

  Future<List<CartItemModel>> getCartItems() async {
    final db = await database;
    final maps = await db.query('cart_items');

    return List.generate(maps.length, (i) {
      return CartItemModel.fromJson(maps[i]);
    });
  }
}
