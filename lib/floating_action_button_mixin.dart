// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'button_type.dart';

mixin FloatingActionButtonMixin {
  FloatingActionButton floatingActionButton(ButtonType type) {
    switch (type) {
      case (ButtonType.small):
        return FloatingActionButton.small(
          child: const Icon(Icons.add),
          onPressed: () {
            print("Tapped small FAB");
          },
        );
      case (ButtonType.large):
        return FloatingActionButton.large(
          child: const Icon(Icons.add),
          onPressed: () {
            print("Tapped large FAB");
          },
        );
      case (ButtonType.extended):
        return FloatingActionButton.extended(
          onPressed: () {
            print("Tapped extended FAB");
          },
          label: const Text("Tap on this"),
          icon: const Icon(Icons.arrow_upward),
        );
      default:
        return FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print("Tapped standard FAB");
          },
        );
    }
  }
}
