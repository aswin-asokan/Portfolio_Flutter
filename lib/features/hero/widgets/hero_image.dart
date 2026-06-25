import 'package:flutter/material.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/hero_image.png",
          height: Responsive.isMobile(context) ? 500 : 800,
          fit: BoxFit.cover,
        ),
        if (Responsive.isDesktop(context) ||
            Responsive.isDesktopLarge(context) | Responsive.isTablet(context))
          Positioned(
            left: 0,
            bottom: 0,
            child: SizedBox(
              child: Text(
                "PortFolio",
                softWrap: true,
                overflow: TextOverflow.visible,
                style: context.textTheme.titleLarge,
              ),
            ),
          ),
        if (Responsive.isMobile(context) || Responsive.isSmallTablet(context))
          Positioned(
            right: 0,
            bottom: 10,
            child: SizedBox(
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "PortFolio",
                  style: context.textTheme.titleLarge!.copyWith(
                    fontSize: Responsive.isMobile(context) ? 80 : 150,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
