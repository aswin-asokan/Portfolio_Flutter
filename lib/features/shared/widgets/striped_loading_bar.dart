import 'package:flutter/material.dart';

/// A progress bar with animated diagonal stripes.
///
/// [progress] should be in the range 0.0 – 1.0.
class StripedLoadingBar extends StatelessWidget {
  const StripedLoadingBar({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final safeProgress = progress.clamp(0.0, 1.0);
    final percent = (safeProgress * 100).round();

    return SizedBox(
      width: 300,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 30,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: Colors.black87, width: 1.8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(end: safeProgress),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: value,
                        child: const SizedBox.expand(
                          child: CustomPaint(
                            painter: _StripedProgressPainter(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 48,
            child: Text(
              '$percent%',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF7B61FF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StripedProgressPainter extends CustomPainter {
  const _StripedProgressPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(size.height),
    );

    // Base purple fill
    canvas.drawRRect(rrect, Paint()..color = const Color(0xFF8B6DFF));

    // Clip to rounded progress
    canvas.save();
    canvas.clipRRect(rrect);

    // Diagonal stripes
    final stripePaint =
        Paint()
          ..color = Colors.white.withValues(alpha: 0.30)
          ..strokeWidth = 4;

    const spacing = 10.0;

    for (double x = -size.height; x < size.width + size.height; x += spacing) {
      canvas.drawLine(
        Offset(x, size.height),
        Offset(x + size.height, 0),
        stripePaint,
      );
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
