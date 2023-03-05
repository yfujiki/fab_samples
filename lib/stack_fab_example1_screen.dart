import 'package:flutter/material.dart';

class StackFabExample1Screen extends StatelessWidget {
  const StackFabExample1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack Example 1"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
