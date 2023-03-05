import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'stack_fab_example1_screen.dart';
import 'stack_fab_root_screen.dart';

class StackFabLocation extends BeamLocation<BeamState> {
  StackFabLocation(super.routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey("/stack"),
        child: StackFabRootScreen(),
      ),
      if (state.uri.path.startsWith("/stack/1") == true)
        const BeamPage(
          key: ValueKey("/stack/1"),
          child: StackFabExample1Screen(),
        )
    ];
  }

  @override
  List<Pattern> get pathPatterns => ["/stack*"];
}
