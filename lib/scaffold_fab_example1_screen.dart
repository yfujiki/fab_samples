// ignore_for_file: avoid_print

import 'button_location.dart';
import 'floating_action_button_mixin.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'button_type.dart';
import 'custom_segmented_button.dart';

class ScaffoldFabExample1Screen extends StatefulWidget {
  const ScaffoldFabExample1Screen({super.key});

  static final faker = Faker();
  static final fakeData = List<String>.generate(50, (_) => faker.person.name());
  static const List<ButtonType> buttonTypes = ButtonType.values;
  static const List<ButtonLocation> buttonLocations = ButtonLocation.values;

  @override
  State<ScaffoldFabExample1Screen> createState() =>
      _ScaffoldFabExample1ScreenState();
}

class _ScaffoldFabExample1ScreenState extends State<ScaffoldFabExample1Screen>
    with FloatingActionButtonMixin {
  var _selectedButtonType = ButtonType.standard;
  var _selectedButtonLocation = ButtonLocation.endFloat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Example"),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                child: CustomSegmentedButton(
                  segments: ScaffoldFabExample1Screen.buttonTypes
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
            );
          }
          if (index == 1) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                child: CustomSegmentedButton(
                  segments: ScaffoldFabExample1Screen.buttonLocations
                      .map((e) => ButtonSegment(
                            value: e,
                            label: Text(e.toString()),
                          ))
                      .toList(),
                  selected: {_selectedButtonLocation},
                  onSelectionChanged: (p0) {
                    setState(() {
                      _selectedButtonLocation = p0.first;
                    });
                  },
                ),
              ),
            );
          }
          return ListTile(
            title: Text(ScaffoldFabExample1Screen.fakeData[index]),
          );
        },
        itemCount: ScaffoldFabExample1Screen.fakeData.length + 2,
      ),
      floatingActionButton: floatingActionButton(_selectedButtonType),
      floatingActionButtonLocation: _selectedButtonLocation.location,
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Bottom Bar",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
