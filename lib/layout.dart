import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 4')),
      backgroundColor: Colors.redAccent,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: double.infinity,
              color: Colors.amber,
            ),
            Expanded(
              child: Container(
                width: 100,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.deepPurpleAccent,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 100,
              height: double.infinity,
              color: Colors.greenAccent,
            ),
          ],
        ),
      )),
    );
  }
}
