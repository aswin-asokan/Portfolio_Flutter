import 'dart:math' as math;
import 'package:flutter/material.dart';

enum SparkleCorner { topLeft, topRight, bottomLeft, bottomRight }

class SparklePainter extends CustomPainter {
  final Color color;
  final SparkleCorner corner;
  final double strokeWidth;
  final double extraSpread;

  SparklePainter({
    required this.color,
    required this.corner,
    this.strokeWidth = 3.5,
    this.extraSpread = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    canvas.save();

    // Translate and rotate canvas around center to align the sparkle to any corner
    canvas.translate(centerX, centerY);
    switch (corner) {
      case SparkleCorner.topRight:
        // Base orientation
        break;
      case SparkleCorner.topLeft:
        canvas.rotate(-math.pi / 2);
        break;
      case SparkleCorner.bottomRight:
        canvas.rotate(math.pi / 2);
        break;
      case SparkleCorner.bottomLeft:
        canvas.rotate(math.pi);
        break;
    }
    canvas.translate(-centerX, -centerY);

    // Draw three hand-drawn lines wrapping around the corner
    
    // Line 1: Top line starting from the top curve (almost vertical) - rotated by -extraSpread
    canvas.save();
    canvas.translate(centerX, centerY);
    canvas.rotate(-extraSpread);
    canvas.translate(-centerX, -centerY);
    canvas.drawLine(const Offset(12, 10), const Offset(15, 1), paint);
    canvas.restore();

    // Line 2: Middle line (radiating up-right) - stays centered
    canvas.drawLine(const Offset(20, 16), const Offset(31, 8), paint);

    // Line 3: Bottom line (almost horizontal) - rotated by extraSpread
    canvas.save();
    canvas.translate(centerX, centerY);
    canvas.rotate(extraSpread);
    canvas.translate(-centerX, -centerY);
    canvas.drawLine(const Offset(23, 25), const Offset(36, 26), paint);
    canvas.restore();

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant SparklePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.corner != corner ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.extraSpread != extraSpread;
  }
}

class CornerHighlight extends StatelessWidget {
  final Widget child;
  final SparkleCorner corner;
  final Color color;
  final double strokeWidth;
  final double extraSpread;
  final bool show;

  const CornerHighlight({
    super.key,
    required this.child,
    this.corner = SparkleCorner.topRight,
    this.color = const Color(0xFFFDD835), // yellow accent from mockup
    this.strokeWidth = 3.5,
    this.extraSpread = 0.0,
    this.show = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return child;

    double? left;
    double? right;
    double? top;
    double? bottom;

    // Independent offsets adjusted to create a perfect gap/space from the child corner.
    switch (corner) {
      case SparkleCorner.topRight:
        top = -12.0;
        right = -24.0;
        break;
      case SparkleCorner.topLeft:
        top = -24.0;
        left = -12.0;
        break;
      case SparkleCorner.bottomRight:
        bottom = -24.0;
        right = -12.0;
        break;
      case SparkleCorner.bottomLeft:
        bottom = -12.0;
        left = -24.0;
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
          child: IgnorePointer(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CustomPaint(
                painter: SparklePainter(
                  color: color,
                  corner: corner,
                  strokeWidth: strokeWidth,
                  extraSpread: extraSpread,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
