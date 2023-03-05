import 'package:flutter/material.dart';

class ScaffoldFabRootScreen extends StatelessWidget {
  const ScaffoldFabRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
