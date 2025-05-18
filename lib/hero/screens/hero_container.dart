import 'package:flutter/material.dart';
import 'package:portfolio/hero/widgets/hero_left.dart';
import 'package:portfolio/hero/widgets/hero_right.dart';
import 'package:portfolio/shared/widgets/custom_container.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return CustomContainer(
      color: Colors.transparent,
      padding: EdgeInsets.all(0),
      child: SizedBox(
        height: height * 0.825,
        child: Row(
          children: [
            Expanded(flex: 6, child: HeroLeft()),
            Expanded(flex: 4, child: HeroRight()),
          ],
        ),
      ),
    );
  }
}
