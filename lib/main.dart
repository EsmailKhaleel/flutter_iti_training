import 'package:flutter/material.dart';
// import 'package:iti_training/home_screen.dart';
import 'package:iti_training/layout.dart';

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
      home: const LayoutScreen(),
    );
  }
}
