import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_training/cubit/product_cubit.dart';
import 'package:iti_training/cubit/product_firestore_cubit.dart';
import 'package:iti_training/screens/add_product.dart';
import 'package:iti_training/screens/favorites.dart';
import 'package:iti_training/screens/firebase_products.dart';
import 'package:iti_training/screens/products.dart';

class ProductsLayoutScreen extends StatefulWidget {
  const ProductsLayoutScreen({super.key});

  @override
  State<ProductsLayoutScreen> createState() => _ProductsLayoutScreenState();
}

class _ProductsLayoutScreenState extends State<ProductsLayoutScreen> {
  int _selectedIndex = 0;
  Widget content = const ProductsScreen();

  void toggleScreens(int value) {
    if (value == 0) {
      setState(() {
        _selectedIndex = value;
        content = const ProductsScreen();
      });
    }
    if (value == 1) {
      setState(() {
        _selectedIndex = value;
        content = const FirebaseProductsScreen();
      });
    }
    if (value == 2) {
      setState(() {
        _selectedIndex = value;
        content = const AddProductScreen();
      });
    }
    if (value == 3) {
      setState(() {
        _selectedIndex = value;
        content = const FavoritesScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit()..getProducts(),
        ),
        BlocProvider(
          create: (context) => ProductFirestoreCubit()..getProducts(),
        ),
      ],
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 10, 14, 33),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              _selectedIndex == 0 ? 'Explore Products' : 'Favorites',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          body: content,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).colorScheme.onPrimaryFixed,
              primaryColor: const Color.fromARGB(255, 235, 21, 85),
              textTheme: Theme.of(context).textTheme.copyWith(
                    titleMedium: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                selectedItemColor: const Color.fromARGB(255, 235, 21, 85),
                unselectedItemColor: Colors.white,
                currentIndex: _selectedIndex,
                onTap: (value) => toggleScreens(value),
                items: const [
                  BottomNavigationBarItem(
                      label: "DUMMY JSON", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "FIREBASE", icon: Icon(Icons.fireplace)),
                  BottomNavigationBarItem(
                      label: "ADD PRODUCT", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "WISHLIST", icon: Icon(Icons.favorite)),
                ]),
          )),
    );
  }
}
