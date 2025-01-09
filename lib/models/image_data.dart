class ImageData {
  final String name;
  final String path;
  final String details;
  final String whattodo;
  final String mapImagePath;
  

  ImageData({
    required this.name,
    required this.path,
    required this.details,
    required this.whattodo,
    required this.mapImagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
      'details': details,
      'whattodo': whattodo,
      'mapImagePath': mapImagePath,
    };
  }
}

class User {
  final int id;
  final String username;
  final String password;

  User({
    required this.id,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }
}

class FavoriteData {
  final String name;
  final String path;
  final String details;
  final String whattodo;
  final String mapImagePath;

  FavoriteData({
    required this.name,
    required this.path,
    required this.details,
    required this.whattodo,
    required this.mapImagePath,
  });
}
