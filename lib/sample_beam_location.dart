import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'root_screen.dart';
import 'scaffold_fab_example1_screen.dart';
import 'stack_fab_example1_screen.dart';

class SampleBeamLocation extends BeamLocation<BeamState> {
  SampleBeamLocation(super.routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        title: "/",
        key: ValueKey("/"),
        child: RootScreen(),
      ),
      if (state.uri.path.startsWith("/scaffold") == true)
        const BeamPage(
          title: "Scaffold Example",
          key: ValueKey("/scaffold"),
          child: ScaffoldFabExample1Screen(),
        ),
      if (state.uri.path.startsWith("/stack1") == true)
        const BeamPage(
          title: "Stack Example 1",
          key: ValueKey("/stack1"),
          child: StackFabExample1Screen(),
        ),
      if (state.uri.path.startsWith("/stack2") == true)
        const BeamPage(
          title: "Stack Example 2",
          key: ValueKey("/stack2"),
          child: StackFabExample1Screen(),
        )
    ];
  }

  @override
  List<Pattern> get pathPatterns => ["/*"];
}
