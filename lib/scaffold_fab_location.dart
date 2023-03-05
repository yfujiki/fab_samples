import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'scaffold_fab_example1_screen.dart';
import 'scaffold_fab_root_screen.dart';

class ScaffoldFabLocation extends BeamLocation<BeamState> {
  ScaffoldFabLocation(super.routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        title: "Scaffold",
        key: ValueKey("/scaffold"),
        child: ScaffoldFabRootScreen(),
      ),
      if (state.uri.path.startsWith("/scaffold/1") == true)
        const BeamPage(
          title: "Scaffold Example 1",
          key: ValueKey("/scaffold/1"),
          type: BeamPageType.noTransition,
          child: ScaffoldFabExample1Screen(),
        )
    ];
  }

  @override
  List<Pattern> get pathPatterns => ["/scaffold*"];
}
