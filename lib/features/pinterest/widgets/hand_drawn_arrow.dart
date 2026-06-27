import 'package:flutter/material.dart';

class HandDrawnArrowPainter extends CustomPainter {
  final Color color;

  HandDrawnArrowPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Start near bottom-left, swoop down, then swoop up to top-right
    final start = Offset(10, size.height * 0.7);
    final end = Offset(size.width - 10, size.height * 0.3);

    path.moveTo(start.dx, start.dy);
    path.cubicTo(
      size.width * 0.45,
      size.height * 1.35,
      size.width * 0.7,
      size.height * 0.05,
      end.dx,
      end.dy,
    );

    canvas.drawPath(path, paint);

    // Arrowhead drawing
    final arrowPath = Path();
    // Top barb
    arrowPath.moveTo(end.dx - 12, end.dy - 2);
    arrowPath.lineTo(end.dx, end.dy);
    // Bottom barb
    arrowPath.lineTo(end.dx - 4, end.dy + 12);

    canvas.drawPath(arrowPath, paint);
  }

  @override
  bool shouldRepaint(covariant HandDrawnArrowPainter oldDelegate) =>
      oldDelegate.color != color;
}

class HandDrawnArrow extends StatelessWidget {
  final Color color;
  const HandDrawnArrow({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HandDrawnArrowPainter(color: color),
    );
  }
}
