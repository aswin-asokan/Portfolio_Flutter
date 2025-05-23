import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/experience/widgets/exp_card.dart';
import 'package:portfolio/responsive/responsive.dart';

class Experience extends StatelessWidget {
  Experience({super.key});

  final List<Map<String, dynamic>> experiences = [
    {
      "icon": Symbols.school,
      "role": "Bootcamp Instructor",
      "org": "ISTE MACE Chapter",
      "period": "Apr 2025 - Present",
      "summary": [
        "Guided 30+ students in a Flutter app development bootcamp.",
        "Covered multi-page app functionality",
        "Provided training on integrating apps with an online database.",
        "Created and shared structured documentation",
      ],
      "url": "https://aswin-asokan.github.io/iste_bootcamp/",
      "hasLink": true,
    },
    {
      "icon": Symbols.computer,
      "role": "Flutter Developer",
      'org': "Flysoft Systems | Intern",
      "period": "Oct 2024 - Dec 2024",
      "summary": [
        "Contributed to the development of a Flutter application for restaurants.",
        "Enabled users to create customized multi-floor plans.",
        "Integrated features to arrange tables and optimize layouts with intuitive controls.",
        "Implemented interactive design tools for a better user experience.",
      ],
      "hasFile": true,
      "file": "https://aswinasokan.vercel.app/assets/assets/files/flysoft.pdf",
      "filename": "Flysoft_internship_report.pdf",
    },
    {
      "icon": Symbols.lightbulb_outline,
      "role": "Technology Lead",
      'org': "IEDC Kalamassery",
      'period': "Aug 2021 - Mar 2023",
      "summary": [
        "Actively organized and coordinated Yanthrika 2K22 Idea Fest.",
        "Managed the evaluation of 25+ innovative project ideas.",
        "Organized a 3D printing workshop with 50+ participants.",
        "Conducted an IoT workshop, engaging 30+ students in hands-on learning.",
      ],
    },
    {
      "icon": Symbols.android,
      "role": "Flutter Developer",
      "org": "Laxmiinfotek | Intern",
      "period": "Sep 2022",
      "summary": [
        "Successfully completed an internship program.",
        "Developed a To-Do application using Flutter.",
        "Applied core concepts of UI design and state management.",
        "Implemented firebase connection",
      ],
      "hasFile": true,
      "file":
          "https://aswinasokan.vercel.app/assets/assets/files/laxmiinfotek.jpeg",
      "filename": "Laxmiinfotek_internship_certificate.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final List<Widget> experienceWidgets = [];
    for (int i = 0; i < experiences.length; i += 2) {
      final Map<String, dynamic> exp1 = experiences[i];
      final Map<String, dynamic>? exp2 =
          (i + 1 < experiences.length) ? experiences[i + 1] : null;
      final ExpCard card1 = ExpCard(
        icon: exp1["icon"] as IconData,
        role: exp1["role"] as String,
        org: exp1["org"] as String,
        period: exp1["period"] as String,
        summary: exp1["summary"] as List<String>,
        url: exp1["url"] as String?,
        hasLink: exp1["hasLink"] as bool? ?? false,
        file: exp1["file"] as String?,
        hasFile: exp1["hasFile"] as bool? ?? false,
        filename: exp1["filename"] as String?,
      );

      ExpCard? card2;
      if (exp2 != null) {
        card2 = ExpCard(
          icon: exp2["icon"] as IconData,
          role: exp2["role"] as String,
          org: exp2["org"] as String,
          period: exp2["period"] as String,
          summary: exp2["summary"] as List<String>,
          url: exp2["url"] as String?,
          hasLink: exp2["hasLink"] as bool? ?? false,
          file: exp2["file"] as String?,
          hasFile: exp2["hasFile"] as bool? ?? false,
          filename: exp2["filename"] as String?,
        );
      }
      if (isMobile) {
        experienceWidgets.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              card1,
              if (card2 != null) ...[const SizedBox(height: 20), card2],
            ],
          ),
        );
      } else {
        experienceWidgets.add(
          Row(
            children: [
              Expanded(child: card1),
              if (card2 != null) ...[
                const SizedBox(width: 20),
                Expanded(child: card2),
              ],
            ],
          ),
        );
      }
      if (i + 2 < experiences.length) {
        experienceWidgets.add(const SizedBox(height: 20));
      }
    }

    return Column(children: experienceWidgets);
  }
}
