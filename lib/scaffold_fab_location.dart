import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'scaffold_fab_example1_screen.dart';
import 'scaffold_fab_root_screen.dart';

class ScaffoldFabLocation extends BeamLocation {
  ScaffoldFabLocation(super.routeInformation);

  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    return [
      const BeamPage(
        key: ValueKey("/scaffold"),
        child: ScaffoldFabRootScreen(),
      ),
      const BeamPage(
        key: ValueKey("/scaffold/1"),
        child: ScaffoldFabExample1Screen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => ["/scaffold"];
}
