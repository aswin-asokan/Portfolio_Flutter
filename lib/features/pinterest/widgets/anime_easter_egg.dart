import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/widgets/pixel_tooltip_bubble.dart';

class AnimeEasterEgg extends StatefulWidget {
  final VoidCallback? onTap;
  final double? height;

  const AnimeEasterEgg({
    super.key,
    this.onTap,
    this.height,
  });

  @override
  State<AnimeEasterEgg> createState() => _AnimeEasterEggState();
}

class _AnimeEasterEggState extends State<AnimeEasterEgg> {
  bool _isHovered = false;
  OverlayEntry? _overlayEntry;

  void _showTooltip() {
    _hideTooltip(); // Clear any existing overlay

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // Use a fixed width for the "Click me" tooltip
    const double tooltipWidth = 110.0;
    final double globalCenterX = position.dx + size.width / 2;

    // Position above the icon
    final double leftPos = (globalCenterX - tooltipWidth / 2).clamp(
      16.0,
      screenWidth - tooltipWidth - 16.0,
    );

    // Calculate dynamic tail offset so it points exactly to the center of the icon
    final double actualCenterOnTooltip = globalCenterX - leftPos;
    final double tailXOffset = (actualCenterOnTooltip / tooltipWidth).clamp(0.15, 0.85);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: leftPos,
              bottom: screenHeight - position.dy + 8.0,
              width: tooltipWidth,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  color: Colors.transparent,
                  child: PixelTooltipBubble(
                    message: "Click me",
                    showBelow: false,
                    tailXOffset: tailXOffset,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double resolvedHeight = widget.height ?? AppConstants.iconSize68;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _showTooltip();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _hideTooltip();
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Hide tooltip upon clicking
          _hideTooltip();
          widget.onTap?.call();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutBack,
          transform: _isHovered
              ? Matrix4.translationValues(0, -6, 0)
              : Matrix4.identity(),
          child: AnimatedScale(
            scale: _isHovered ? 1.12 : 1.0,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            child: AnimatedRotation(
              turns: _isHovered ? 0.02 : 0.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: Image.asset(
                "assets/images/pinterest/anime_easter_egg.webp",
                height: resolvedHeight,
                cacheWidth: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
