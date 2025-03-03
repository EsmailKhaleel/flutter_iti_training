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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            OutlinedButton.icon(
              label: const Icon(Icons.add),
              onPressed: _incrementCounter,
              icon: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            OutlinedButton.icon(
              label: const Icon(Icons.minimize),
              onPressed: _decrementCounter,
              icon: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
