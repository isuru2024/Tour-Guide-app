import 'package:flutter/material.dart';
import '../models/image_data.dart';
import '../services/sqflite_service.dart';

class FavoriteProvider with ChangeNotifier {
  List<ImageData> _favorites = [];

  List<ImageData> get favorites => _favorites;

  // Fetch favorites from the database
  Future<void> fetchFavorites() async {
    final favorites = await SqfliteService.fetchFavorites();
    _favorites = favorites.map((favorite) => ImageData(
      name: favorite.name,
      path: favorite.path,
      details: favorite.details,
      whattodo: favorite.whattodo,
      mapImagePath: favorite.mapImagePath,
    )).toList();
    notifyListeners();
  }

  // Add a favorite
  Future<void> addFavorite(ImageData imageData) async {
    await SqfliteService.addFavorite(imageData);
    _favorites.add(imageData);
    notifyListeners();
  }

  // Remove a favorite
  Future<void> removeFavorite(ImageData imageData) async {
    await SqfliteService.removeFavorite(imageData);
    _favorites.removeWhere((item) => item.path == imageData.path);
    notifyListeners();
  }
}