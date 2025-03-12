import 'package:flutter/material.dart';
import 'package:iti_training/models/product.dart';
import 'package:iti_training/widgets/product_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
