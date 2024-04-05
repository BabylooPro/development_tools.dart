import 'package:flutter/material.dart';
import 'tools/development_lines_painter.dart';
import 'tools/test_icons_screen.dart';
import 'tools/test_widgets_screen.dart';

void main() {
  runApp(const DevelopmentToolsApp());
}

// DEVELOPMENT TOOLS APP
class DevelopmentToolsApp extends StatelessWidget {
  const DevelopmentToolsApp({super.key});

  // BUILD METHOD FOR APP
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Development Tools',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: const DevelopmentToolsPage(title: 'Development Tools'),
    );
  }
}

// DEVELOPMENT TOOLS PAGE
class DevelopmentToolsPage extends StatefulWidget {
  final String title;
  const DevelopmentToolsPage({super.key, required this.title});

  @override
  State<DevelopmentToolsPage> createState() => _DevelopmentToolsPageState();
}

// DEVELOPMENT TOOLS PAGE STATE
class _DevelopmentToolsPageState extends State<DevelopmentToolsPage> {
  // BOOLEAN ACCESS TOOLS FOR ACTIVATION ANY DEVELOPMENT PAGE WITHOUT NAVIGATION
  bool _showDevelopmentLines = false;
  final bool _showTestIconsScreen = false;
  final bool _showTestWidgetsScreen = false;

  // INIT STATE
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_showTestIconsScreen || _showTestWidgetsScreen) {
        _navigateToScreen(
          _showTestIconsScreen
              ? const TestIconsScreen()
              : const TestWidgetsScreen(),
          replace: true,
        );
      }
    });
  }

  // NAVIGATE TO SCREEN METHOD
  void _navigateToScreen(Widget screen, {bool replace = false}) {
    if (replace) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => _buildWithDevelopmentLines(screen)));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => _buildWithDevelopmentLines(screen)));
    }
  }

  Widget _buildWithDevelopmentLines(Widget child) {
    return DevelopmentLines(
      showDevelopmentLines: _showDevelopmentLines,
      child: child,
    );
  }

  // BUILD METHOD FOR PAGE
  @override
  Widget build(BuildContext context) {
    return _buildWithDevelopmentLines(
      Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LIST OF DEVELOPMENT TOOLS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () => _navigateToScreen(const TestIconsScreen()),
                child: const Text('Go to Screen Test Icons'),
              ),
              ElevatedButton(
                onPressed: () => _navigateToScreen(const TestWidgetsScreen()),
                child: const Text('Go to Screen Test Widgets'),
              ),
              SwitchListTile(
                title: const Text('Show Development Lines'),
                value: _showDevelopmentLines,
                onChanged: (bool value) {
                  setState(() {
                    _showDevelopmentLines = value;
                  });
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 75),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
