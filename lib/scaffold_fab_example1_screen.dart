import 'package:flutter/material.dart';

class ScaffoldFabExample1Screen extends StatelessWidget {
  const ScaffoldFabExample1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Example 1"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
