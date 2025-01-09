import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/image_data.dart';

class SqfliteService {
  static Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'image_database.db');
    final Database db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE images(name TEXT, path TEXT, details TEXT, whattodo TEXT, mapImagePath TEXT)');
      await db.execute(
          'CREATE TABLE favorites(name TEXT, path TEXT, details TEXT, whattodo TEXT, mapImagePath TEXT)');
    });
  }

  static Future<void> insertImage(ImageData imageData) async {
    final Database db = await _initDatabase();
    await db.insert(
      'images',
      imageData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<ImageData>> fetchImageData() async {
    final Database db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('images');
    return List.generate(maps.length, (i) {
      return ImageData(
        name: maps[i]['name'],
        path: maps[i]['path'],
        details: maps[i]['details'],
        whattodo: maps[i]['whattodo'],
        mapImagePath: maps[i]['mapImagePath'],
      );
    });
  }

  static Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'image_database.db');
    return openDatabase(path);
  }

  static Future<void> addFavorite(ImageData imageData) async {
    final Database db = await _initDatabase();

    // Check if the item already exists in favorites
    final existingFavorite = await db.query(
      'favorites',
      where: 'path = ?',
      whereArgs: [imageData.path],
    );

    // If the item doesn't exist, insert it
    if (existingFavorite.isEmpty) {
      await db.insert(
        'favorites',
        imageData.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
  }

  static Future<void> removeFavorite(ImageData imageData) async {
    final Database db = await _initDatabase();
    await db.delete(
      'favorites',
      where: 'name = ?',
      whereArgs: [imageData.name],
    );
  }

  static Future<bool> isFavorite(ImageData imageData) async {
    final Database db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'favorites',
      where: 'path = ?',
      whereArgs: [imageData.path],
    );
    return maps.isNotEmpty;
  }

  static Future<List<FavoriteData>> fetchFavorites() async {
    final Database db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return List.generate(maps.length, (i) {
      return FavoriteData(
        name: maps[i]['name'],
        path: maps[i]['path'],
        details: maps[i]['details'],
        whattodo: maps[i]['whattodo'],
        mapImagePath: maps[i]['mapImagePath'],
      );
    });
  }
}
