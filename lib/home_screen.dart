import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: [
          const Icon(Icons.star),
          IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.add)),
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.onSurface,
        child: Center(
          child: Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            child: const Icon(Icons.remove, size: 32),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.add, size: 32),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
