import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  static const List<Map<String, String>> data = [
    {
      "title": "Using Scaffold",
      "path": "/scaffold1",
    },
    {
      "title": "Using Stack and Alignment",
      "path": "/stack1",
    },
    {
      "title": "Using Stack and Positioned",
      "path": "/stack2",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floating Action Button Samples"),
        backgroundColor: Colors.black12,
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
