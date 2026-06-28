import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final Color color;

  const StarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final outlinePaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.8
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round;

    final double w = size.width;
    final double h = size.height;

    // Scale factors based on design size 48
    final double cx1 = w * 0.3125;
    final double cy1 = h * 0.3125;
    final double r1 = w * 0.24;

    // Shift small star closer to the large star
    final double cx2 = w * 0.58;
    final double cy2 = h * 0.56;
    final double r2 = w * 0.125;

    // Draw Large Star (Outline)
    _drawSparkle(canvas, outlinePaint, cx1, cy1, r1);

    // Draw Small Star (Filled)
    _drawSparkle(canvas, fillPaint, cx2, cy2, r2);
  }

  void _drawSparkle(
    Canvas canvas,
    Paint paint,
    double cx,
    double cy,
    double r,
  ) {
    final path = Path();
    path.moveTo(cx, cy - r);
    path.quadraticBezierTo(cx, cy, cx + r, cy);
    path.quadraticBezierTo(cx, cy, cx, cy + r);
    path.quadraticBezierTo(cx, cy, cx - r, cy);
    path.quadraticBezierTo(cx, cy, cx, cy - r);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant StarPainter oldDelegate) =>
      oldDelegate.color != color;
}

class DecorativeStars extends StatelessWidget {
  final double size;

  const DecorativeStars({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return IgnorePointer(
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: StarPainter(color: isDark ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

enum StarPosition { topLeft, topRight, bottomLeft, bottomRight }

class CornerStars extends StatelessWidget {
  final Widget child;
  final StarPosition position;
  final bool show;

  const CornerStars({
    super.key,
    required this.child,
    this.position = StarPosition.topLeft,
    this.show = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return child;

    double? left;
    double? right;
    double? top;
    double? bottom;

    switch (position) {
      case StarPosition.topLeft:
        left = -16;
        top = -16;
        break;

      case StarPosition.topRight:
        right = -40;
        top = -16;
        break;

      case StarPosition.bottomLeft:
        left = -16;
        bottom = -16;
        break;

      case StarPosition.bottomRight:
        right = -16;
        bottom = -16;
        break;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          left: left,
          right: right,
          top: top,
          bottom: bottom,
          child: const DecorativeStars(),
        ),
      ],
    );
  }
}
