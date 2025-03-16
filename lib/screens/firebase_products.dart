import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_training/cubit/product_firestore_cubit.dart';
import 'package:iti_training/cubit/product_firestore_state.dart';
import 'package:iti_training/widgets/products_list.dart';

class FirebaseProductsScreen extends StatefulWidget {
  const FirebaseProductsScreen({super.key});

  @override
  State<FirebaseProductsScreen> createState() => _FirebaseProductsScreenState();
}

class _FirebaseProductsScreenState extends State<FirebaseProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductFirestoreCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFirestoreCubit, ProductFirestoreState>(
      builder: (context, state) {
        if (state is ProductsFirestoreLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsFirestoreSuccsessState) {
          return ProductsList(
              products: context.read<ProductFirestoreCubit>().products);
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
