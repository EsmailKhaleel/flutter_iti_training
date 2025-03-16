import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_training/cubit/product_cubit.dart';
import 'package:iti_training/cubit/product_state.dart';
import 'package:iti_training/widgets/products_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsSuccsessState) {
          return ProductsList(products: context.read<ProductsCubit>().products);
        } else {
          return const Center(
            child: Text(
              "Failed to load products",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}
