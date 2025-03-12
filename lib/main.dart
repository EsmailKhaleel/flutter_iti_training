import 'package:flutter/material.dart';
import 'package:iti_training/screens/bmi.dart';
import 'package:iti_training/screens/counter.dart';
import 'package:iti_training/screens/layout.dart';
import 'package:iti_training/screens/login.dart';
import 'package:iti_training/screens/messenger.dart';
import 'package:iti_training/screens/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylish Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 45, 12, 42)),
        useMaterial3: true,
      ),
      home: const LabsScreen(),
    );
  }
}

class LabsScreen extends StatelessWidget {
  const LabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        title: const Text(
          'Flutter Tasks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CounterScreen(),
                )),
                child: const Text("Counter lab"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
                )),
                child: const Text("Layout Lab"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                )),
                child: const Text("Login Lab"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BmiScreen(),
                )),
                child: const Text("BMI Lab"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MessengerScreen(),
                )),
                child: const Text("Messenger Lab"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BmiScreen(),
                )),
                child: const Text("BMI Lab"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProductsScreen(),
                )),
                child: const Text("API Lab"),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
