import 'package:flutter/material.dart';

enum ButtonAlignment {
  topLeft(Alignment.topLeft),
  centerLeft(Alignment.centerLeft),
  bottomLeft(Alignment.bottomLeft),
  topCenter(Alignment.topCenter),
  center(Alignment.center),
  bottomCenter(Alignment.bottomCenter),
  topRight(Alignment.topRight),
  centerRight(Alignment.centerRight),
  bottomRight(Alignment.bottomRight);

  final Alignment alignment;

  const ButtonAlignment(this.alignment);
}
