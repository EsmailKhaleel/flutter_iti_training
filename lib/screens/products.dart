import 'package:flutter/material.dart';
import 'package:iti_training/dio/dio_service.dart';
import 'package:iti_training/models/product.dart';
import 'package:iti_training/widgets/products_list.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = [];
  bool isLoading = true;
  String error = '';

  void loadProducts() {
    DioService.getProducts().then((loadedProducts) {
      if (loadedProducts != null) {
        setState(() {
          isLoading = false;
          products = loadedProducts;
        });
      }
    }).catchError((e) {
      setState(() {
        error = e.toString();
      });
    });
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 14, 33),
      appBar: AppBar(
        title: const Text(
          'Explore Products',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(
                  child: Text(
                    error,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : products.isEmpty
                  ? const Center(
                      child: Text(
                        "No products found!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                  : ProductsList(products: products),
    );
  }
}
