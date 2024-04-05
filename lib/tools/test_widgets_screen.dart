import 'package:flutter/material.dart';

class TestWidgetsScreen extends StatefulWidget {
  const TestWidgetsScreen({super.key});

  @override
  State<TestWidgetsScreen> createState() => _TestWidgetsScreenState();
}

class _TestWidgetsScreenState extends State<TestWidgetsScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      const SizedBox(height: 20),
      const Placeholder(
        fallbackHeight: 100,
        fallbackWidth: 100,
        color: Colors.blue,
      ),
      const SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          hintText: 'Enter a search term',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Image.network(
        'https://images.unsplash.com/photo-1694969044549-2fc831df070a?q=80&w=2800',
        width: 200,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Widgets'),
        backgroundColor: Colors.grey,
        // forceMaterialTransparency: true,
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, index) => Align(
          alignment: Alignment.topCenter,
          child: widgets[index],
        ),
      ),
    );
  }
}
