import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iti_training/models/product.dart';

class DioService {
  static Future<List<Product>?> getProducts() async {
    List<Product> products = [];

    try {
      var response = await Dio().get("https://dummyjson.com/products");
      if (response.statusCode == 200 && response.data["products"] != null) {
        products = (response.data["products"] as List).map((product) {
          return Product(
            id: product["id"],
            title: product["title"],
            description: product["description"],
            category: product["category"],
            stock: product["stock"],
            thumbnail: product["thumbnail"],
            price: product["price"],
          );
        }).toList();
      }
    } catch (e) {
      debugPrint("Error fetching products: $e");
    }
    return products;
  }
}
