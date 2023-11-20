import 'package:flutter/material.dart';

class TriangleShape extends StatelessWidget {
  const TriangleShape({
    super.key,
    this.size = const Size(10, 10),
    this.color = Colors.blue,
  });
  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size, // Adjust the size as needed
      painter: TrianglePainter(color: color),
    );
  }
}

class TrianglePainter extends CustomPainter {
  TrianglePainter({required this.color});
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // Color of the triangle
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0); // Top point
    path.lineTo(0, size.height); // Bottom-left point
    path.lineTo(size.width, size.height / 2); // Bottom-right point
    path.close(); // Close the path to complete the triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
