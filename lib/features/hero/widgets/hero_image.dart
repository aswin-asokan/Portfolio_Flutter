import 'package:flutter/material.dart';
import 'package:portfolio/responsive/responsive.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isSmallTablet = Responsive.isSmallTablet(context);
    final bool isMobileLayout = isMobile || isSmallTablet;

    return Align(
      alignment: isMobileLayout ? Alignment.center : Alignment.centerRight,
      child: Image.asset(
        Theme.of(context).brightness == Brightness.dark
            ? "assets/images/hero/hero_img_dark.webp"
            : "assets/images/hero/hero_img_light.webp",
        width: isMobileLayout ? double.infinity : null,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
