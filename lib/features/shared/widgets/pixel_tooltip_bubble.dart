import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PixelTooltipBubble extends StatelessWidget {
  final String message;
  final bool showBelow;
  final double tailXOffset;

  const PixelTooltipBubble({
    super.key,
    required this.message,
    required this.showBelow,
    required this.tailXOffset,
  });

  @override
  Widget build(BuildContext context) {
    final padding = showBelow
        ? const EdgeInsets.fromLTRB(12, 18, 12, 10)
        : const EdgeInsets.fromLTRB(12, 10, 12, 18);

    return CustomPaint(
      painter: PixelBubblePainter(
        tailOnTop: showBelow,
        tailXOffset: tailXOffset,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 180),
        padding: padding,
        child: Text(
          message,
          style: GoogleFonts.pixelifySans(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.3,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class PixelBubblePainter extends CustomPainter {
  final bool tailOnTop;
  final double tailXOffset;

  PixelBubblePainter({
    required this.tailOnTop,
    this.tailXOffset = 0.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintFill = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final paintBorder = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.square;

    final double w = size.width;
    final double hBox = size.height - 12; // box height excluding 12px tail space

    final double yMin = tailOnTop ? 12.0 : 0.0;
    final double yMax = tailOnTop ? size.height : hBox;

    final double inset = 6.0;
    final path = Path();

    // Start at Top-Left Corner
    path.moveTo(inset, yMin);

    // If tail is on top, draw the pixelated top tail
    if (tailOnTop) {
      final double tx = w * tailXOffset;
      path.lineTo(tx - 8, yMin);
      path.lineTo(tx - 8, yMin - 6);
      path.lineTo(tx - 4, yMin - 6);
      path.lineTo(tx - 4, yMin - 12); // Tip of tail
      path.lineTo(tx + 2, yMin - 12);
      path.lineTo(tx + 2, yMin - 6);
      path.lineTo(tx + 8, yMin - 6);
      path.lineTo(tx + 8, yMin);
    }

    path.lineTo(w - inset, yMin);

    // Top-Right corner (blocky steps)
    path.lineTo(w - inset, yMin + inset);
    path.lineTo(w, yMin + inset);

    // Right edge
    path.lineTo(w, yMax - inset);

    // Bottom-Right corner
    path.lineTo(w - inset, yMax - inset);
    path.lineTo(w - inset, yMax);

    // If tail is at bottom, draw the pixelated bottom tail
    if (!tailOnTop) {
      final double tx = w * tailXOffset;
      path.lineTo(tx + 8, yMax);
      path.lineTo(tx + 8, yMax + 6);
      path.lineTo(tx + 2, yMax + 6);
      path.lineTo(tx + 2, yMax + 9);
      path.lineTo(tx - 4, yMax + 9);
      path.lineTo(tx - 4, yMax + 12); // Tip of tail
      path.lineTo(tx - 8, yMax + 12);
      path.lineTo(tx - 8, yMax + 6);
      path.lineTo(tx - 4, yMax + 6);
      path.lineTo(tx - 4, yMax);
    }

    path.lineTo(inset, yMax);

    // Bottom-Left corner
    path.lineTo(inset, yMax - inset);
    path.lineTo(0, yMax - inset);

    // Left edge
    path.lineTo(0, yMin + inset);

    // Top-Left corner close
    path.lineTo(inset, yMin + inset);
    path.lineTo(inset, yMin);
    path.close();

    canvas.drawPath(path, paintFill);
    canvas.drawPath(path, paintBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
