import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  final String authToken;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
    this.authToken,
  });

  void _setFavoriteValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners(); 
  }

  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    final url = 'https://flutter-shop-cd2f2.firebaseio.com/products/$id.json?auth=$authToken';

    _setFavoriteValue(!isFavorite);

    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );

      if (response.statusCode >= 400) {
        _setFavoriteValue(oldStatus);
      }
    } catch (err) {
      _setFavoriteValue(oldStatus);
      notifyListeners();
    }
  }
}
