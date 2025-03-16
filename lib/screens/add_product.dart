import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_training/models/product.dart';
import 'package:iti_training/cubit/product_firestore_cubit.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredTitle;
  String? _enteredDescription;
  String? _enteredCategory;
  String? _enteredStock;
  String? _enteredPrice;
  String? _enteredThumbnail;

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Future<void> _addProduct(Product product) async {
    debugPrint('Adding product: $product');
    try {
      await context.read<ProductFirestoreCubit>().addProduct(product);
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error adding product'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            const SizedBox(height: 60),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.title),
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: _validateField,
              onSaved: (newValue) => _enteredTitle = newValue!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.description),
                labelText: 'DESCRIPTION',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: _validateField,
              onSaved: (newValue) => _enteredDescription = newValue!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.category),
                labelText: 'CATEGORY',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: _validateField,
              onSaved: (newValue) => _enteredCategory = newValue!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.production_quantity_limits),
                labelText: 'STOCK',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: _validateField,
              onSaved: (newValue) => _enteredStock = newValue!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.price_change),
                labelText: 'PRICE',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: _validateField,
              onSaved: (newValue) => _enteredPrice = newValue!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.image),
                labelText: 'THUMBNAIL',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: _validateField,
              onSaved: (newValue) => _enteredThumbnail = newValue!,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  _formKey.currentState!.save();
                  final product = Product(
                    title: _enteredTitle!,
                    description: _enteredDescription!,
                    category: _enteredCategory!,
                    stock: int.parse(_enteredStock!),
                    price: double.parse(_enteredPrice!),
                    thumbnail: _enteredThumbnail!,
                  );
                  _addProduct(product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                icon: const Icon(Icons.login_outlined, color: Colors.white),
                label: const Text("ADD PRODUCT",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ]),
        ));
  }
}
