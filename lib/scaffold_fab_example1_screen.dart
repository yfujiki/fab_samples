// ignore_for_file: avoid_print

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

enum ButtonSize { small, standard, large }

extension on ButtonSize {
  String get title {
    switch (this) {
      case ButtonSize.large:
        return "Large";
      case ButtonSize.small:
        return "Small";
      default:
        return "Medium";
    }
  }
}

class ScaffoldFabExample1Screen extends StatefulWidget {
  const ScaffoldFabExample1Screen({super.key});

  static final faker = Faker();
  static final fakeData = List<String>.generate(50, (_) => faker.person.name());
  static const List<ButtonSize> buttonSizes = [
    ButtonSize.small,
    ButtonSize.standard,
    ButtonSize.large
  ];

  @override
  State<ScaffoldFabExample1Screen> createState() =>
      _ScaffoldFabExample1ScreenState();
}

class _ScaffoldFabExample1ScreenState extends State<ScaffoldFabExample1Screen> {
  var _selectedButtonSize = ButtonSize.standard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Example 1"),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: SegmentedButton(
                segments: ScaffoldFabExample1Screen.buttonSizes
                    .map((e) => ButtonSegment(
                          value: e,
                          label: Text(e.title),
                        ))
                    .toList(),
                selected: {_selectedButtonSize},
                onSelectionChanged: (p0) {
                  setState(() {
                    _selectedButtonSize = p0.first;
                  });
                },
              ),
            );
          }
          return ListTile(
            title: Text(ScaffoldFabExample1Screen.fakeData[index]),
          );
        },
        itemCount: ScaffoldFabExample1Screen.fakeData.length + 1,
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  _floatingActionButton() {
    switch (_selectedButtonSize) {
      case (ButtonSize.small):
        return FloatingActionButton.small(
          child: const Icon(Icons.question_mark),
          onPressed: () {
            print("Tapped small FAB");
          },
        );
      case (ButtonSize.large):
        return FloatingActionButton.large(
          child: const Icon(Icons.question_mark),
          onPressed: () {
            print("Tapped large FAB");
          },
        );
      default:
        return FloatingActionButton(
          child: const Icon(Icons.question_mark),
          onPressed: () {
            print("Tapped standard FAB");
          },
        );
    }
  }
}
