import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'scaffold_fab_location.dart';
import 'stack_fab_location.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({super.key});

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  // keep track of the currently selected index
  late int _currentIndex;

  // create two nested delegates
  final _routerDelegates = [
    BeamerDelegate(
      initialPath: '/scaffold',
      locationBuilder: (routeInformation, _) {
        print("Route in scaffold: ${routeInformation.location}");
        if (routeInformation.location!.startsWith('/scaffold')) {
          return ScaffoldFabLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/stack',
      locationBuilder: (routeInformation, _) {
        print("Route in stack: ${routeInformation.location}");
        if (routeInformation.location!.startsWith('/stack')) {
          return StackFabLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
  ];

  // update the _currentIndex if necessary
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    _currentIndex = uriString.startsWith('/stack') ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey,
      //   title: const Text("FAB samples"),
      // ),
      // use an IndexedStack to choose which child to show
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // use Beamer widgets as children
          Beamer(
            routerDelegate: _routerDelegates[0],
          ),
          Beamer(
            routerDelegate: _routerDelegates[1],
          ),
        ],
      ),
      // the usual BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(label: 'Scaffold', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Stack', icon: Icon(Icons.stacked_bar_chart)),
        ],
        onTap: (index) {
          if (index != _currentIndex) {
            setState(() => _currentIndex = index);
            _routerDelegates[_currentIndex].update(rebuild: false);
          }
        },
      ),
    );
  }
}
