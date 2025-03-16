import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iti_training/cubit/product_firestore_state.dart';
import 'package:iti_training/models/product.dart';

class ProductFirestoreCubit extends Cubit<ProductFirestoreState> {
  ProductFirestoreCubit() : super(ProductsFirestoreInitaialState());
  List<Product> products = [];
  final store = FirebaseFirestore.instance;

  void getProducts() async {
    emit(ProductsFirestoreLoadingState());
    debugPrint("Getting products from Firestore");
    try {
      final querySnapshot = await store.collection('firebaseproducts').get();
      debugPrint("QuerySnapshot: $querySnapshot");
      products = querySnapshot.docs.map((doc) {
        return Product(
          title: doc['title'],
          description: doc['description'],
          category: doc['category'],
          stock: doc['stock'],
          thumbnail: doc['thumbnail'],
          price: doc['price'],
        );
      }).toList();
      debugPrint("Products: $products");
      emit(ProductsFirestoreSuccsessState());
    } catch (e) {
      debugPrint("Error fetching products: $e");
      emit(ProductsFirestoreErrorState());
    }
  }

  Future<void> addProduct(Product product) async {
    emit(AddProductLoadingState());
    try {
      await store.collection('firebaseproducts').add({
        'title': product.title,
        'description': product.description,
        'category': product.category,
        'stock': product.stock,
        'thumbnail': product.thumbnail,
        'price': product.price,
      });
      emit(AddProductSuccessState());
    } catch (e) {
      debugPrint("Error adding product: $e");
      emit(AddProductErrorState());
      throw Exception("Error adding product: $e");
    }
  }
}
