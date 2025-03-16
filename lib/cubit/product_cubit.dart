import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_training/cubit/product_state.dart';
import 'package:iti_training/dio/dio_service.dart';
import 'package:iti_training/models/product.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit() : super(ProductsInitaialState());
  List<Product> products = [];

  void getProducts() {
    emit(ProductsLoadingState());
    DioService().getProducts().then((response) {
      try {
        if (response.statusCode == 200 && response.data["products"] != null) {
          products = (response.data["products"] as List).map((product) {
            return Product(
              title: product["title"],
              description: product["description"],
              category: product["category"],
              stock: product["stock"],
              thumbnail: product["thumbnail"],
              price: product["price"],
            );
          }).toList();
          emit(ProductsSuccsessState());
        }
      } catch (e) {
        debugPrint("Error fetching products: $e");
        emit(ProductsErrorState());
      }
      return products;
    });
  }
}
