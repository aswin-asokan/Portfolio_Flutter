import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/widgets/hero_image.dart';

class HeroRight extends StatelessWidget {
  const HeroRight({super.key, this.width = 450});
  final double width;

  @override
  Widget build(BuildContext context) {
    return const HeroImage();
  }
}
