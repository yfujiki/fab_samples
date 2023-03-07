// ignore_for_file: avoid_print

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ScaffoldFabExample2Screen extends StatelessWidget {
  const ScaffoldFabExample2Screen({super.key});

  static final faker = Faker();
  static final fakeData = List<String>.generate(50, (_) => faker.person.name());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Example 2"),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ScaffoldFabExample2Screen.fakeData[index]),
          );
        },
        itemCount: ScaffoldFabExample2Screen.fakeData.length,
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  _floatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        print("Tapped extended FAB");
      },
      label: const Text("CTA"),
      icon: const Icon(Icons.share),
    );
  }
}
