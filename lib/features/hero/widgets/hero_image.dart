import 'package:flutter/material.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/hero_image.png",
          height: 800,
          fit: BoxFit.cover,
        ),
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
      ],
    );
  }
}
