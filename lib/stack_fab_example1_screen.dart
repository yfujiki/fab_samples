// ignore_for_file: avoid_print

import 'button_alignment.dart';
import 'floating_action_button_mixin.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'button_type.dart';
import 'custom_segmented_button.dart';

class StackFabExample1Screen extends StatefulWidget {
  const StackFabExample1Screen({super.key});

  static final faker = Faker();
  static final fakeData = List<String>.generate(50, (_) => faker.person.name());
  static const List<ButtonType> buttonTypes = ButtonType.values;
  static const List<ButtonAlignment> buttonAlignments = ButtonAlignment.values;

  @override
  State<StackFabExample1Screen> createState() => _StackFabExample1ScreenState();
}

class _StackFabExample1ScreenState extends State<StackFabExample1Screen>
    with FloatingActionButtonMixin {
  var _selectedButtonType = ButtonType.standard;
  var _selectedButtonAlignment = ButtonAlignment.bottomRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack with Alignment"),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: CustomSegmentedButton(
                segments: StackFabExample1Screen.buttonTypes
                    .map((e) => ButtonSegment(
                          value: e,
                          label: Text(e.title),
                        ))
                    .toList(),
                selected: {_selectedButtonType},
                onSelectionChanged: (p0) {
                  setState(() {
                    _selectedButtonType = p0.first;
                  });
                },
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: CustomSegmentedButton(
                segments: StackFabExample1Screen.buttonAlignments
                    .map((e) => ButtonSegment(
                          value: e,
                          label: Text(e.toString()),
                        ))
                    .toList(),
                selected: {_selectedButtonAlignment},
                onSelectionChanged: (p0) {
                  setState(() {
                    _selectedButtonAlignment = p0.first;
                  });
                },
              ),
            ),
          ),
          _body(),
        ],
      ),
    );
  }

  Flexible _body() {
    return Flexible(
      child: Stack(
        alignment: _selectedButtonAlignment.alignment,
        children: [
          ListView.builder(
            itemCount: StackFabExample1Screen.fakeData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print("tapped");
                },
                child: ListTile(
                  title: Text(StackFabExample1Screen.fakeData[index]),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: floatingActionButton(_selectedButtonType),
          ),
        ],
      ),
    );
  }
}
