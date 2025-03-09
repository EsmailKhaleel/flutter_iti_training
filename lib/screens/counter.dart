import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
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
        title: Text("Home",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          const Icon(Icons.star, color: Colors.white),
          IconButton(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add, color: Colors.white)),
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
            heroTag: const ValueKey('fab1'),
            onPressed: _decrementCounter,
            child: const Icon(Icons.remove, size: 32),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: const ValueKey('fab2'),
            onPressed: _incrementCounter,
            child: const Icon(Icons.add, size: 32),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
