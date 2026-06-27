import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/about/widgets/about_splash_card.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
    required this.onNavigate,
    required this.contactKey,
  });

  final void Function(GlobalKey key) onNavigate;
  final GlobalKey contactKey;

  @override
  Widget build(BuildContext context) {
    return AboutSplashCard(
      title: "About Me",
      description:
          "I'm a developer who loves crafting beautiful, functional, and user-friendly web experiences. When I'm not coding, you'll find me drawing, crafting, or listening to music.",
      image: Image.asset(
        "assets/images/about/about_image.webp",
        fit: BoxFit.contain,
      ),
      items: [
        SplashCardItem(
          icon: Image.asset(
            "assets/images/about/focus.webp",
            width: AppConstants.iconSizeAbout,
            height: AppConstants.iconSizeAbout,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          title: "Focus",
          subtitle: "Frontend\nDeveloper",
        ),
        SplashCardItem(
          icon: Image.asset(
            "assets/images/about/hobbies.webp",
            width: AppConstants.iconSizeAbout,
            height: AppConstants.iconSizeAbout,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          title: "Hobbies",
          subtitle: "Art, Craft,\nReading",
        ),
        SplashCardItem(
          icon: Image.asset(
            "assets/images/about/fuel.webp",
            width: AppConstants.iconSizeAbout,
            height: AppConstants.iconSizeAbout,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          title: "Fuel",
          subtitle: "Lofi\n& Playlists",
        ),
        SplashCardItem(
          icon: Image.asset(
            "assets/images/about/personality.webp",
            width: AppConstants.iconSizeAbout,
            height: AppConstants.iconSizeAbout,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          title: "Personality",
          subtitle: "Curious, Creative,\nImproving",
        ),
      ],
    );
  }
}
