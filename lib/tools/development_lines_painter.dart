import 'package:flutter/material.dart';

// DEVELOPMENT LINES PAINTER
class DevelopmentLines extends StatelessWidget {
  final Widget? child;
  final bool showDevelopmentLines;

  const DevelopmentLines(
      {super.key, this.child, required this.showDevelopmentLines});

  // WIDGET BUILDER METHOD FOR DEVELOPMENT LINES
  @override
  Widget build(BuildContext context) {
    // SHOW DEVELOPMENT LINES
    if (showDevelopmentLines) {
      return Stack(
        children: [
          if (child != null) child!,
          // IGNORE POINTER IN UI
          IgnorePointer(
            child: CustomPaint(
              painter: LinePainter(),
              size: Size.infinite,
            ),
          ),
        ],
      );
    }
    return child ?? const SizedBox.shrink(); // HIDE DEVELOPMENT LINES
  }
}

// LINE PAINTER CLASS
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red // COLOR LINE
      ..strokeWidth = 1.0; // WIDTH LINE

    // DRAW LINES VERTICAL IN MIDDLE
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );

    // DRAW LINES HORIZONTAL IN MIDDLE
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    // DRAW LINES VERTICAL IN QUARTERS
    canvas.drawLine(
      Offset(size.width - 100, 0),
      Offset(size.width - 100, size.height),
      paint,
    );

    // DRAW LINES HORIZONTAL IN QUARTERS
    canvas.drawLine(
      const Offset(100, 0),
      Offset(100, size.height),
      paint,
    );

    // DRAW LINES VERTICAL IN QUARTERS
    canvas.drawLine(
      Offset(0, size.height - 100),
      Offset(size.width, size.height - 100),
      paint,
    );

    // DRAW LINES HORIZONTAL IN QUARTERS
    canvas.drawLine(
      const Offset(0, 100),
      Offset(size.width, 100),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
