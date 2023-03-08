import 'package:flutter/material.dart';

enum ButtonLocation {
  leftTop,
  leftMiddle,
  leftBottom,
  centerBottom,
  rightBottom,
  rightMiddle,
  rightTop,
  centerTop
}

extension ButtonLocationExtension on ButtonLocation {
  String get title {
    switch (this) {
      case ButtonLocation.leftTop:
        return "Left Top";
      case ButtonLocation.leftMiddle:
        return "Left Middle";
      case ButtonLocation.leftBottom:
        return "Left Bottom";
      case ButtonLocation.centerBottom:
        return "Center Bottom";
      case ButtonLocation.rightBottom:
        return "Right Bottom";
      case ButtonLocation.rightMiddle:
        return "Right Middle";
      case ButtonLocation.rightTop:
        return "Right Top";
      case ButtonLocation.centerTop:
        return "Center Top";
    }
  }

  Alignment get alignment {
    switch (this) {
      case ButtonLocation.leftTop:
        return Alignment.topLeft;
      case ButtonLocation.leftMiddle:
        return Alignment.centerLeft;
      case ButtonLocation.leftBottom:
        return Alignment.bottomLeft;
      case ButtonLocation.centerBottom:
        return Alignment.bottomCenter;
      case ButtonLocation.rightBottom:
        return Alignment.bottomRight;
      case ButtonLocation.rightMiddle:
        return Alignment.centerRight;
      case ButtonLocation.rightTop:
        return Alignment.topRight;
      case ButtonLocation.centerTop:
        return Alignment.topCenter;
    }
  }
}
