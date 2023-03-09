// ignore_for_file: avoid_print

import 'floating_action_button_mixin.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'button_type.dart';
import 'custom_segmented_button.dart';

class StackFabExample2Screen extends StatefulWidget {
  const StackFabExample2Screen({super.key});

  static final faker = Faker();
  static final fakeData = List<String>.generate(50, (_) => faker.person.name());
  static const List<ButtonType> buttonTypes = ButtonType.values;

  @override
  State<StackFabExample2Screen> createState() => _StackFabExample2ScreenState();
}

class _StackFabExample2ScreenState extends State<StackFabExample2Screen>
    with FloatingActionButtonMixin {
  var _selectedButtonType = ButtonType.standard;
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack with Positioned"),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              child: CustomSegmentedButton(
                segments: StackFabExample2Screen.buttonTypes
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
          _body(),
        ],
      ),
    );
  }

  Flexible _body() {
    return Flexible(
      child: Stack(
        children: [
          ListView.builder(
            itemCount: StackFabExample2Screen.fakeData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print("tapped");
                },
                child: ListTile(
                  title: Text(StackFabExample2Screen.fakeData[index]),
                ),
              );
            },
          ),
          Positioned(
            left: _left,
            top: _top,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _left += details.delta.dx;
                  _top += details.delta.dy;
                });
              },
              child: floatingActionButton(_selectedButtonType),
            ),
          ),
        ],
      ),
    );
  }
}
