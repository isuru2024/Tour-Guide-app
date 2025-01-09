import 'package:flutter/material.dart';
import '../services/sqflite_service.dart';
import '../models/image_data.dart';
import 'image_detail_screen.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({Key? key}) : super(key: key);

  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  Future<List<ImageData>>? _imageList; // Make _imageList nullable

  @override
  void initState() {
    super.initState();
    // Fetch the image data only once when the widget is initialized
    if (_imageList == null) {
      _fetchImageData();
    }
  }

  Future<void> _fetchImageData() async {
    _imageList = SqfliteService.fetchImageData();
    setState(() {}); // Trigger a rebuild after fetching the data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 6, 0, 60),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'Explore Sri Lanka',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: FutureBuilder<List<ImageData>>(
        future: _imageList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data![index].name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageDetailScreen(
                                imageData: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(
                            'assets/${snapshot.data![index].path}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
