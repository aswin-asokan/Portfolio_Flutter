import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/experience/widgets/exp_card.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          spacing: 20,
          children: [
            Expanded(
              child: ExpCard(
                icon: Symbols.school,
                role: "Bootcamp Instructor",
                org: "ISTE MACE Chapter",
                period: "Apr 2025 - Present",
                summary: [
                  "Guided 30+ students in a Flutter app development bootcamp.",
                  "Covered multi-page app functionality",
                  "Provided training on integrating apps with an online database.",
                  "Created and shared structured documentation",
                ],
              ),
            ),
            Expanded(
              child: ExpCard(
                icon: Symbols.computer,
                role: "Flutter Developer Intern",
                org: "Flysoft Systems",
                period: "Oct 2024 - Dec 2024",
                summary: [
                  "Contributed to the development of a Flutter application for restaurants.",
                  "Enabled users to create customized multi-floor plans.",
                  "Integrated features to arrange tables and optimize layouts with intuitive controls.",
                  "Implemented interactive design tools for a better user experience.",
                ],
              ),
            ),
          ],
        ),
        Row(
          spacing: 20,
          children: [
            Expanded(
              child: ExpCard(
                icon: Symbols.lightbulb_outline,
                role: "Technology Lead",
                org: "IEDC Kalamassery",
                period: "Aug 2021 - Mar 2023",
                summary: [
                  "Actively organized and coordinated Yanthrika 2K22 Idea Fest.",
                  "Managed the evaluation of 25+ innovative project ideas.",
                  "Organized a 3D printing workshop with 50+ participants.",
                  "Conducted an IoT workshop, engaging 30+ students in hands-on learning.",
                ],
              ),
            ),
            Expanded(
              child: ExpCard(
                icon: Symbols.android,
                role: "Flutter Developer Intern",
                org: "Laxmiinfotek",
                period: "Sep 2022",
                summary: [
                  "Successfully completed an internship program organized ",
                  "Developed a To-Do application using Flutter.",
                  "Applied core concepts of UI design and state management.",
                  "Implemented firebase connection",
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
