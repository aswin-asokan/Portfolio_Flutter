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
          "I'm a Flutter developer who loves turning ideas into apps people enjoy using. When I'm not arguing with pixels or chasing the perfect animation, you'll probably find me drawing, crafting, or vibing to a good playlist.",
      image: Image.asset(
        "assets/images/about/about_image.webp",
        cacheWidth: 600,
        fit: BoxFit.contain,
        gaplessPlayback: true,
      ),
      items: [
        SplashCardItem(
          icon: Image.asset(
            "assets/images/about/focus.webp",
            width: AppConstants.iconSizeAbout,
            height: AppConstants.iconSizeAbout,
            cacheWidth: 400,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            gaplessPlayback: true,
          ),
          title: "Focus",
          subtitle: "Frontend\nDeveloper",
        ),
        SplashCardItem(
          icon: Image.asset(
            "assets/images/about/hobbies.webp",
            width: AppConstants.iconSizeAbout,
            height: AppConstants.iconSizeAbout,
            cacheWidth: 400,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            gaplessPlayback: true,
          ),
          title: "Hobbies",
          subtitle: "Art, Craft,\nReading",
        ),
        SplashCardItem(
          icon: Image.asset(
            "assets/images/about/fuel.webp",
            width: AppConstants.iconSizeAbout,
            height: AppConstants.iconSizeAbout,
            cacheWidth: 400,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            gaplessPlayback: true,
          ),
          title: "Fuel",
          subtitle: "Lofi\n& Playlists",
        ),
        SplashCardItem(
          icon: Image.asset(
            "assets/images/about/personality.webp",
            width: AppConstants.iconSizeAbout,
            height: AppConstants.iconSizeAbout,
            cacheWidth: 400,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            gaplessPlayback: true,
          ),
          title: "Personality",
          subtitle: "Curious, Creative,\nImproving",
        ),
      ],
    );
  }
}
