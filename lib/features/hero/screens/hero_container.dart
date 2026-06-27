import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/widgets/hero_right.dart';
import 'package:portfolio/features/hero/widgets/hero_left.dart';
import 'package:portfolio/responsive/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallTablet = Responsive.isSmallTablet(context);
    return !Responsive.isMobile(context)
        ? ConstrainedBox(
            constraints: BoxConstraints(minHeight: isSmallTablet ? 0.0 : 550.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Expanded(
                    child: HeroLeft(),
                  ),
                  Expanded(
                    child: HeroRight(),
                  ),
                ],
              ),
            ),
          )
        : Column(
            children: [
              const HeroLeft(),
              const SizedBox(height: 20),
              const HeroRight(),
            ],
          );
  }
}
