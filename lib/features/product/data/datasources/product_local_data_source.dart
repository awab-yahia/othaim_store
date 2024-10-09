// import 'package:othaim_store/features/product/data/models/product_model.dart';
import 'package:othaim_store/features/product/data/models/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProductLocalDataSource {
  static final ProductLocalDataSource _instance =
      ProductLocalDataSource._internal();
  factory ProductLocalDataSource() => _instance;
  ProductLocalDataSource._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'online_products.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'DROP TABLE IF EXISTS products'); // Drop the existing table
        await db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY, title TEXT, price REAL, category TEXT, description TEXT, image TEXT)',
        );
      },
    );
  }

  Future<void> insertProduct(ProductModel product) async {
    try {
      final db = await database;
      await db.insert(
        'products',
        product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getProducts() async {
    final db = await database;
    final maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }
}
