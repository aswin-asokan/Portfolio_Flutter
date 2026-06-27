import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/widgets/hero_right.dart';
import 'package:portfolio/features/hero/widgets/hero_left.dart';
import 'package:portfolio/responsive/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return !Responsive.isMobile(context)
        ? ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 550),
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
