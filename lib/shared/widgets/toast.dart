import 'package:flutter/material.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';

void showToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  // Toast widget with animation
  overlayEntry = OverlayEntry(
    builder:
        (context) => ToastAnimationWidget(
          message: message,
          onDismiss: () {
            overlayEntry.remove();
          },
        ),
  );

  overlay.insert(overlayEntry);
}

class ToastAnimationWidget extends StatefulWidget {
  final String message;
  final VoidCallback onDismiss;

  const ToastAnimationWidget({
    Key? key,
    required this.message,
    required this.onDismiss,
  }) : super(key: key);

  @override
  State<ToastAnimationWidget> createState() => _ToastAnimationWidgetState();
}

class _ToastAnimationWidgetState extends State<ToastAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();

    // Automatically dismiss the toast after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _controller.reverse().then((_) => widget.onDismiss());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 40, // Bottom padding

      right: 0,
      left: 0,
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _controller.value,
              child: Transform.translate(
                offset: Offset(
                  0,
                  20 * (1 - _controller.value),
                ), // Slide up from bottom
                child: child,
              ),
            );
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black87.withAlpha(80),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                widget.message,
                style: context.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
