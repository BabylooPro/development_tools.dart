import 'package:flutter/material.dart';

// TEST ICONS SCREEN
class TestIconsScreen extends StatelessWidget {
  const TestIconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // LIST OF ICONS WITH NAME TO TEST
    final iconPairs = [
      Pair("AC", const Icon(Icons.ac_unit, color: Colors.blueAccent)),
      Pair("Zoom Out", const Icon(Icons.zoom_out_map_rounded)),
      Pair("Accessibility", const Icon(Icons.accessibility, size: 50)),
      Pair("Alarm", const Icon(Icons.access_alarm)),
      Pair("Warning", const Icon(Icons.warning, color: Colors.orange)),
      Pair("Person", const Icon(Icons.person, size: 50)),
      Pair("Percent", const Icon(Icons.percent)),
      Pair("Home", const Icon(Icons.home, color: Colors.red)),
    ];

    // FILL GRID WITH ICONS
    const int gridCount = 64;
    final List<Pair?> filledIconPairs =
        List<Pair?>.filled(gridCount, null, growable: false);
    for (int i = 0; i < iconPairs.length && i < gridCount; i++) {
      filledIconPairs[i] = iconPairs[i];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Icons'),
        // forceMaterialTransparency: true,
        backgroundColor: Colors.grey,
      ),
      // GRID VIEW BUILDER FOR ICONS (4X4)
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: gridCount,
        itemBuilder: (context, index) {
          final iconPair = filledIconPairs[index];
          if (iconPair == null) return const SizedBox.shrink();

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 20),
              iconPair.icon,
              const SizedBox(height: 10),
              Text(
                iconPair.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// PAIR CLASS FOR ICONS AND NAMES
class Pair {
  final String name;
  final Widget icon;
  Pair(this.name, this.icon);
}
