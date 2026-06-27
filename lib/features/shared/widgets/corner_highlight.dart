import 'dart:math' as math;
import 'package:flutter/material.dart';

enum SparkleCorner {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  topCenter,
  topCentre,
  bottomCenter,
  bottomCentre,
  rightCenter,
  rightCentre,
  leftCenter,
  leftCentre,
}

class SparklePainter extends CustomPainter {
  final Color color;
  final SparkleCorner corner;
  final double strokeWidth;
  final double extraSpread;
  final double lengthFactor;

  SparklePainter({
    required this.color,
    required this.corner,
    this.strokeWidth = 3.5,
    this.extraSpread = 0.0,
    this.lengthFactor = 1.0,
  });

  bool get _isCenterMode =>
      corner == SparkleCorner.topCenter ||
      corner == SparkleCorner.topCentre ||
      corner == SparkleCorner.bottomCenter ||
      corner == SparkleCorner.bottomCentre ||
      corner == SparkleCorner.rightCenter ||
      corner == SparkleCorner.rightCentre ||
      corner == SparkleCorner.leftCenter ||
      corner == SparkleCorner.leftCentre;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    canvas.save();

    if (_isCenterMode) {
      // Translate and rotate canvas around center to point the lines outward
      canvas.translate(centerX, centerY);
      switch (corner) {
        case SparkleCorner.topCenter:
        case SparkleCorner.topCentre:
          // Base orientation (points straight up)
          break;
        case SparkleCorner.rightCenter:
        case SparkleCorner.rightCentre:
          canvas.rotate(math.pi / 2);
          break;
        case SparkleCorner.bottomCenter:
        case SparkleCorner.bottomCentre:
          canvas.rotate(math.pi);
          break;
        case SparkleCorner.leftCenter:
        case SparkleCorner.leftCentre:
          canvas.rotate(-math.pi / 2);
          break;
        default:
          break;
      }
      canvas.translate(-centerX, -centerY);

      // Draw three lines with different lengths and angles aligned along a horizontal axis (pointing up)
      // Line 1: Left line pointing up-left
      canvas.drawLine(
        Offset(centerX - 6, centerY + 6),
        Offset(centerX - 6 - 3 * lengthFactor, centerY + 6 - 10 * lengthFactor),
        paint,
      );

      // Line 2: Middle line pointing straight up
      canvas.drawLine(
        Offset(centerX, centerY + 4),
        Offset(centerX, centerY + 4 - 12 * lengthFactor),
        paint,
      );

      // Line 3: Right line pointing up-right
      canvas.drawLine(
        Offset(centerX + 6, centerY + 6),
        Offset(centerX + 6 + 3 * lengthFactor, centerY + 6 - 8 * lengthFactor),
        paint,
      );
    } else {
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
        default:
          break;
      }
      canvas.translate(-centerX, -centerY);

      // Draw three hand-drawn lines wrapping around the corner
      // Line 1: Top line starting from the top curve (almost vertical) - rotated by -extraSpread
      canvas.save();
      canvas.translate(centerX, centerY);
      canvas.rotate(-extraSpread);
      canvas.translate(-centerX, -centerY);
      canvas.drawLine(
        const Offset(12, 10),
        Offset(12 + 3 * lengthFactor, 10 - 9 * lengthFactor),
        paint,
      );
      canvas.restore();

      // Line 2: Middle line (radiating up-right) - stays centered
      canvas.drawLine(
        const Offset(20, 16),
        Offset(20 + 11 * lengthFactor, 16 - 8 * lengthFactor),
        paint,
      );

      // Line 3: Bottom line (almost horizontal) - rotated by extraSpread
      canvas.save();
      canvas.translate(centerX, centerY);
      canvas.rotate(extraSpread);
      canvas.translate(-centerX, -centerY);
      canvas.drawLine(
        const Offset(23, 25),
        Offset(23 + 13 * lengthFactor, 25 + 1 * lengthFactor),
        paint,
      );
      canvas.restore();
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant SparklePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.corner != corner ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.extraSpread != extraSpread ||
        oldDelegate.lengthFactor != lengthFactor;
  }
}

class CornerHighlight extends StatelessWidget {
  final Widget child;
  final SparkleCorner corner;
  final Color color;
  final double strokeWidth;
  final double extraSpread;
  final double lengthFactor;
  final bool show;

  const CornerHighlight({
    super.key,
    required this.child,
    this.corner = SparkleCorner.topRight,
    this.color = const Color(0xFFFDD835), // yellow accent from mockup
    this.strokeWidth = 3.5,
    this.extraSpread = 0.0,
    this.lengthFactor = 1.0,
    this.show = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return child;

    Widget sparkle = IgnorePointer(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CustomPaint(
          painter: SparklePainter(
            color: color,
            corner: corner,
            strokeWidth: strokeWidth,
            extraSpread: extraSpread,
            lengthFactor: lengthFactor,
          ),
        ),
      ),
    );

    double? left;
    double? right;
    double? top;
    double? bottom;

    // Independent offsets adjusted to create a perfect gap/space from the child.
    switch (corner) {
      case SparkleCorner.topRight:
        top = -12.0;
        right = -24.0;
        break;
      case SparkleCorner.topLeft:
        top = -18.0;
        left = -15.0;
        break;
      case SparkleCorner.bottomRight:
        bottom = -24.0;
        right = -12.0;
        break;
      case SparkleCorner.bottomLeft:
        bottom = -12.0;
        left = -24.0;
        break;
      case SparkleCorner.topCenter:
      case SparkleCorner.topCentre:
        top = -18.0;
        left = 0;
        right = 0;
        sparkle = Align(alignment: Alignment.topCenter, child: sparkle);
        break;
      case SparkleCorner.bottomCenter:
      case SparkleCorner.bottomCentre:
        bottom = -18.0;
        left = 0;
        right = 0;
        sparkle = Align(alignment: Alignment.bottomCenter, child: sparkle);
        break;
      case SparkleCorner.leftCenter:
      case SparkleCorner.leftCentre:
        left = -18.0;
        top = 0;
        bottom = 0;
        sparkle = Align(alignment: Alignment.centerLeft, child: sparkle);
        break;
      case SparkleCorner.rightCenter:
      case SparkleCorner.rightCentre:
        right = -25.0;
        top = 0;
        bottom = 0;
        sparkle = Align(alignment: Alignment.centerRight, child: sparkle);
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
          child: sparkle,
        ),
      ],
    );
  }
}
