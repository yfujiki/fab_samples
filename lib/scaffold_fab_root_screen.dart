import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class ScaffoldFabRootScreen extends StatelessWidget {
  const ScaffoldFabRootScreen({super.key});

  static const List<Map<String, String>> data = [
    {
      "title": "Standard",
      "path": "/scaffold/1",
    },
    {
      "title": "Extended",
      "path": "/scaffold/2",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold"),
        backgroundColor: Colors.pink,
      ),
      body: ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final e = data[index];

          return ListTile(
            title: Text(e["title"] ?? "-"),
            onTap: () {
              final path = e["path"];
              if (path == null) return;
              Beamer.of(context).beamToNamed(path);
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 1,
            child: Container(
              color: Colors.black12,
            ),
          );
        },
      ),
    );
  }
}
