import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

enum ThemeSwitchMode { darkToLight, lightToDark }

class ThemeSwitchIndicator extends StatelessWidget {
  const ThemeSwitchIndicator({
    super.key,
    required this.mode,
    this.width = 140,
    this.height = 60,
  });

  final ThemeSwitchMode mode;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final isLightToDark = mode == ThemeSwitchMode.lightToDark;

    final selectedBg =
        isLightToDark ? const Color(0xFF120B2B) : const Color(0xFFFFF5D9);

    const borderColor = Color(0xFFD2B9FF);
    const purple = Color(0xFFA86CFF);
    const yellow = Color(0xFFF8BE2C);

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Row(
        children: [
          // Selected icon
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(
              isLightToDark ? Symbols.sunny : Symbols.moon_stars,
              color: isLightToDark ? yellow : purple,
              size: height * 0.42,
              fill: 1,
            ),
          ),

          Expanded(
            child: Center(
              child: Icon(
                Icons.arrow_forward_rounded,
                color: purple,
                size: height * 0.4,
              ),
            ),
          ),

          // Destination icon
          _IconBubble(
            background: selectedBg,
            icon: isLightToDark ? Symbols.moon_stars : Symbols.sunny,
            iconColor: isLightToDark ? purple : yellow,
            size: height - 6,
          ),
        ],
      ),
    );
  }
}

class _IconBubble extends StatelessWidget {
  const _IconBubble({
    required this.background,
    required this.icon,
    required this.iconColor,
    required this.size,
  });

  final Color background;
  final IconData icon;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: background, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Icon(icon, color: iconColor, fill: 1, size: size * 0.52),
    );
  }
}
