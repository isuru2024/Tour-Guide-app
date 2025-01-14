import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import '../models/image_data.dart';

class ImageDetailScreen extends StatelessWidget {
  final ImageData imageData;

  const ImageDetailScreen({Key? key, required this.imageData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    // Check if the item is already in favorites
    final isFavorite =
        favoriteProvider.favorites.any((item) => item.path == imageData.path);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 6, 0, 60),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            Expanded(
              child: Text(
                imageData.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (isFavorite) {
                  await favoriteProvider.removeFavorite(imageData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Removed from favorites')),
                  );
                } else {
                  await favoriteProvider.addFavorite(imageData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to favorites')),
                  );
                }
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
              ),
              tooltip:
                  isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                imageData.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/${imageData.path}',
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 20),
              const Text(
                'Details:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              Text(imageData.details),
              const SizedBox(height: 20),
              const Text(
                'What To Explore:',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(imageData.whattodo),
              const SizedBox(height: 20),
              const Text(
                'Map:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/${imageData.mapImagePath}',
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
