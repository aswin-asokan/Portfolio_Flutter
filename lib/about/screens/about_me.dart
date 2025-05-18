import 'package:flutter/material.dart';
import 'package:portfolio/shared/widgets/custom_button.dart';
import 'package:portfolio/about/widgets/education.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';
import 'package:portfolio/shared/widgets/custom_container.dart';

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
    return CustomContainer(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Text("About Me", style: context.textTheme.labelLarge),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                Expanded(child: Education()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Self-Learning Journey",
                        style: context.textTheme.bodyMedium,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "\t\t\tI embarked on my coding adventure without formal education, driven by curiosity and passion. What started as a hobby quickly turned into a professional pursuit as I went through countless tutorials, documentation, and practice projects.\n\t\t\tThe journey wasn't always smooth, but each challenge became an opportunity to grow. From building my first \"Hello World\" app to developing complex AI-integrated applications, every step has been a valuable learning experience.",
                        style: context.textTheme.bodySmall,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Row(
                        spacing: 20,
                        children: [
                          Expanded(
                            child: CustomButton(
                              label: "Download Resume",
                              onPress: () {},
                            ),
                          ),
                          Expanded(
                            child: CustomButton(
                              label: "Contact Me",
                              onPress: () => onNavigate(contactKey),
                              colorBG: context.colorScheme.surface,
                              colorSide: context.colorScheme.primary,
                              textColor: context.colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
