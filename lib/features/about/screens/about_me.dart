import 'package:flutter/material.dart';
import 'package:portfolio/features/about/widgets/education_right.dart';
import 'package:portfolio/features/about/widgets/education.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/custom_container.dart';
import 'package:portfolio/responsive/responsive.dart';

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
          children: [
            SelectableText("About Me", style: context.textTheme.labelLarge),
            LayoutBuilder(
              builder: (context, constraints) {
                if (!Responsive.isDesktop(context) &&
                    !Responsive.isDesktopLarge(context)) {
                  return Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Education(),
                      EducationRight(
                        contactKey: contactKey,
                        onNavigate: onNavigate,
                      ),
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 30,
                    children: [
                      Expanded(child: Education()),
                      Expanded(
                        child: EducationRight(
                          contactKey: contactKey,
                          onNavigate: onNavigate,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
