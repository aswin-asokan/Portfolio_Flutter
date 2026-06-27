import 'package:flutter/material.dart';

class RetroCursor extends StatelessWidget {
  final double width;
  final Color? fillColor;
  final Color? borderColor;

  const RetroCursor({
    super.key,
    this.width = 24.0,
    this.fillColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    // The classic cursor grid is 12 columns by 19 rows.
    final double height = (width / 12) * 19;
    return CustomPaint(
      size: Size(width, height),
      painter: _RetroCursorPainter(
        fillColor: fillColor ?? Colors.white,
        borderColor: borderColor ?? Colors.black,
      ),
    );
  }
}

class _RetroCursorPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;

  _RetroCursorPainter({
    required this.fillColor,
    required this.borderColor,
  });

  // Classic mouse cursor represented in a 12x19 pixel grid.
  // B = Border, W = Fill, Space = Transparent.
  static const List<String> _grid = [
    'B               ',
    'BB              ',
    'BWB             ',
    'BWWB            ',
    'BWWWB           ',
    'BWWWWB          ',
    'BWWWWWB         ',
    'BWWWWWWB        ',
    'BWWWWWWWB       ',
    'BWWWWWWWWB      ',
    'BWWWWWWWWWB     ',
    'BWWWWWWWWWWB    ',
    'BWWWWWWBBBBB    ',
    'BWWWBWWB        ',
    'BWB  BWWB       ',
    'B    BWWB       ',
    '      BWWB      ',
    '      BWWB      ',
    '       BB       ',
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final double pixelWidth = size.width / 12;
    final double pixelHeight = size.height / 19;

    final Paint borderPaint = Paint()..color = borderColor;
    final Paint fillPaint = Paint()..color = fillColor;

    final Path borderPath = Path();
    final Path fillPath = Path();

    for (int y = 0; y < _grid.length; y++) {
      final String row = _grid[y];
      for (int x = 0; x < row.length; x++) {
        if (x >= 12) break;
        final String char = row[x];
        final Rect rect = Rect.fromLTWH(
          x * pixelWidth,
          y * pixelHeight,
          pixelWidth,
          pixelHeight,
        );
        if (char == 'B') {
          borderPath.addRect(rect);
        } else if (char == 'W') {
          fillPath.addRect(rect);
        }
      }
    }

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _RetroCursorPainter oldDelegate) {
    return oldDelegate.fillColor != fillColor ||
        oldDelegate.borderColor != borderColor;
  }
}
