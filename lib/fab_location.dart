import 'package:flutter/material.dart';

enum FABLocation {
  startTop(FloatingActionButtonLocation.startTop),
  startFloat(FloatingActionButtonLocation.startFloat),
  startDocked(FloatingActionButtonLocation.startDocked),
  centerTop(FloatingActionButtonLocation.centerTop),
  centerFloat(FloatingActionButtonLocation.centerFloat),
  centerDocked(FloatingActionButtonLocation.centerDocked),
  endTop(FloatingActionButtonLocation.endTop),
  endFloat(FloatingActionButtonLocation.endFloat),
  endDocked(FloatingActionButtonLocation.endDocked),
  miniStartTop(FloatingActionButtonLocation.miniStartTop),
  miniStartFloat(FloatingActionButtonLocation.miniStartFloat),
  miniStartDocked(FloatingActionButtonLocation.miniStartDocked),
  miniCenterTop(FloatingActionButtonLocation.miniCenterTop),
  miniCenterFloat(FloatingActionButtonLocation.miniCenterFloat),
  miniCenterDocked(FloatingActionButtonLocation.miniCenterDocked),
  miniEndTop(FloatingActionButtonLocation.miniEndTop),
  miniEndFloat(FloatingActionButtonLocation.miniEndFloat),
  miniEndDocked(FloatingActionButtonLocation.miniEndDocked);

  final FloatingActionButtonLocation location;

  const FABLocation(this.location);
}
