import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Day 4',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryFixed,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: double.infinity,
              color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
            ),
            Expanded(
              child: SizedBox(
                width: 100,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color:
                          Theme.of(context).colorScheme.onPrimaryFixedVariant,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 100,
              height: double.infinity,
              color: Colors.purple,
            ),
          ],
        ),
      )),
    );
  }
}
