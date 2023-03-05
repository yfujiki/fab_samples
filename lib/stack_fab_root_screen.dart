import 'package:flutter/material.dart';

class StackFabRootScreen extends StatelessWidget {
  const StackFabRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Example 1"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
