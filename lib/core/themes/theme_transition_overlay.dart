import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ThemeTransitionOverlay extends StatefulWidget {
  final Widget child;
  final bool isSwitching;

  const ThemeTransitionOverlay({
    super.key,
    required this.child,
    required this.isSwitching,
  });

  @override
  State<ThemeTransitionOverlay> createState() => _ThemeTransitionOverlayState();
}

class _ThemeTransitionOverlayState extends State<ThemeTransitionOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  bool _visible = false;

  Color? _cachedBackgroundColor;
  Color? _cachedForegroundColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.isSwitching) {
      _visible = true;
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant ThemeTransitionOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSwitching != oldWidget.isSwitching) {
      if (widget.isSwitching) {
        final theme = Theme.of(context);
        _cachedBackgroundColor = theme.scaffoldBackgroundColor;
        _cachedForegroundColor = theme.colorScheme.primary;

        setState(() {
          _visible = true;
        });
        _controller.forward();
      } else {
        _controller.reverse().then((_) {
          if (!mounted) return;
          setState(() {
            _visible = false;
            _cachedBackgroundColor = null;
            _cachedForegroundColor = null;
          });
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = _cachedBackgroundColor ?? theme.scaffoldBackgroundColor;
    final fgColor = _cachedForegroundColor ?? theme.colorScheme.primary;

    return Stack(
      children: [
        widget.child,
        if (_visible)
          FadeTransition(
            opacity: _opacityAnimation,
            child: IgnorePointer(
              ignoring: !widget.isSwitching,
              child: Container(
                color: bgColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadingAnimationWidget.dotsTriangle(
                        color: fgColor,
                        size: 80,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Loading...",
                        style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: fgColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
