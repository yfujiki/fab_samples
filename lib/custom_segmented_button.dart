import 'package:flutter/material.dart';

class CustomSegmentedButton<T> extends StatelessWidget {
  const CustomSegmentedButton({
    super.key,
    required this.segments,
    required this.selected,
    this.onSelectionChanged,
    this.multiSelectionEnabled = false,
    this.emptySelectionAllowed = false,
    this.style,
    this.showSelectedIcon = true,
    this.selectedIcon,
  });

  final List<ButtonSegment<T>> segments;
  final Set<T> selected;
  final void Function(Set<T>)? onSelectionChanged;
  final bool multiSelectionEnabled;
  final bool emptySelectionAllowed;
  final ButtonStyle? style;
  final bool showSelectedIcon;
  final Widget? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      style: style ??
          ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) {
              return Colors.black12;
            }),
            foregroundColor: MaterialStateColor.resolveWith((states) {
              if (states.isEmpty) {
                return Colors.black54;
              }
              switch (states.first) {
                case MaterialState.pressed:
                  return Colors.black87;
                case MaterialState.selected:
                  return Colors.black87;
                default:
                  return Colors.black54;
              }
            }),
            side: MaterialStateBorderSide.resolveWith(
                (Set<MaterialState> states) {
              return const BorderSide(color: Colors.black54);
            }),
          ),
      segments: segments,
      selected: selected,
      onSelectionChanged: onSelectionChanged,
      multiSelectionEnabled: multiSelectionEnabled,
      emptySelectionAllowed: emptySelectionAllowed,
      showSelectedIcon: showSelectedIcon,
      selectedIcon: selectedIcon,
    );
  }
}
