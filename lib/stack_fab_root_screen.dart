import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class StackFabRootScreen extends StatelessWidget {
  const StackFabRootScreen({super.key});

  static const List<Map<String, String>> data = [
    {
      "title": "Standard",
      "path": "/stack/1",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Example 1"),
        backgroundColor: Colors.lightGreen,
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
