import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/widgets/hero_left.dart';
import 'package:portfolio/features/hero/widgets/hero_right.dart';
import 'package:portfolio/features/shared/widgets/custom_container.dart';
import 'package:portfolio/responsive/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: Colors.transparent,
      padding: EdgeInsets.all(0),
      child:
          Responsive.isDesktopLarge(context) ||
                  Responsive.isTablet(context) ||
                  Responsive.isDesktop(context)
              ? SizedBox(
                height:
                    !Responsive.isTablet(context)
                        ? 620
                        : Responsive.isDesktop(context)
                        ? 700
                        : 800,
                child: Row(
                  children: [
                    Expanded(
                      flex: !Responsive.isDesktop(context) ? 6 : 5,
                      child: HeroLeft(),
                    ),
                    Expanded(
                      flex: !Responsive.isDesktop(context) ? 4 : 5,
                      child: HeroRight(),
                    ),
                  ],
                ),
              )
              : Column(children: [HeroLeft(), HeroRight()]),
    );
  }
}
