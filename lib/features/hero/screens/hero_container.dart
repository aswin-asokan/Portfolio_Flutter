import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/widgets/hero_left.dart';
import 'package:portfolio/features/hero/widgets/hero_right.dart';
import 'package:portfolio/features/shared/widgets/custom_container.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:web/web.dart' as web;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Size getWebScreenSize() {
    final screen = web.window.screen;
    return Size(screen.width.toDouble(), screen.height.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    final screen = web.window.screen;
    final height = screen.height - 260;
    final width = screen.width;
    return CustomContainer(
      color: Colors.transparent,
      padding: EdgeInsets.all(0),
      child:
          Responsive.isDesktopLarge(context) ||
                  Responsive.isTablet(context) ||
                  Responsive.isDesktop(context)
              ? SizedBox(
                height:
                    Responsive.isDesktopLarge(context)
                        ? height.toDouble()
                        : Responsive.isTablet(context)
                        ? 800
                        : 620,
                child: Row(
                  children: [
                    Expanded(
                      flex: !Responsive.isDesktop(context) ? 6 : 5,
                      child: HeroLeft(width: width.toDouble()),
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
