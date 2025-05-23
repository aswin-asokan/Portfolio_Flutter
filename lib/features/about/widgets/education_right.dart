import 'package:flutter/material.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:web/web.dart' as web;

class EducationRight extends StatelessWidget {
  const EducationRight({
    super.key,
    required this.contactKey,
    required this.onNavigate,
  });
  final void Function(GlobalKey key) onNavigate;
  final GlobalKey contactKey;
  void downloadAssetFile(String assetPath, String downloadFileName) {
    web.HTMLAnchorElement()
      ..href = assetPath
      ..download = downloadFileName
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          "My Self-Learning Journey",
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 15),
        SelectableText(
          "\t\t\tI embarked on my coding adventure without formal education, driven by curiosity and passion. What started as a hobby quickly turned into a professional pursuit as I went through countless tutorials, documentation, and practice projects.\n\t\t\tThe journey wasn't always smooth, but each challenge became an opportunity to grow. From building my first \"Hello World\" app to developing complex AI-integrated applications, every step has been a valuable learning experience.",
          style: context.textTheme.bodySmall,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        Row(
          spacing: 20,
          children: [
            Expanded(
              child: CustomButton(
                label: "Resume",
                onPress: () {
                  downloadAssetFile("assets/files/resume.pdf", "resume");
                },
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
    );
  }
}
