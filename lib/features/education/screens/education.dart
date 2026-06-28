import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/education/widgets/edu_card.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';

class Education extends StatelessWidget {
  Education({super.key});

  final List<Map<String, dynamic>> educationItems = [
    {
      "title": "BTech in Computer Science and Engineering",
      "year": "2023 - 2026",
      "institution": "MACE Kothamangalam",
      "icon": "assets/images/others/mace.webp",
      "url": "https://mace.ac.in/",
    },
    {
      "title": "Diploma in Computer Engineering",
      "year": "2020 - 2023",
      "institution": "GPC Kalamassery",
      "icon": "assets/images/others/gpc.webp",
      "url": "https://gptckalamassery.ac.in/",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: context.colorScheme.surface,
        border: Border.all(color: AppColors.getBorder(context), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Education",
                style: context.textTheme.labelLarge!.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 4),
              Transform.translate(
                offset: const Offset(-12, -10),
                child: Transform.rotate(
                  angle: 0.5, // tilted slightly counter-clockwise
                  child: Icon(
                    Symbols.school,
                    color: AppColors.educationHat,
                    size: AppConstants.iconSizeL,
                    fill: 1,
                  ),
                ),
              ),
            ],
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final double spacing = 16.0;
              final double minWidthPerItem = 450.0;
              final int itemCount = educationItems.length;

              // Check if all items fit in a single row
              final double requiredWidth =
                  (itemCount * minWidthPerItem) + ((itemCount - 1) * spacing);

              if (constraints.maxWidth >= requiredWidth) {
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (int i = 0; i < itemCount; i++) ...[
                        Expanded(
                          child: EduCard(
                            title: educationItems[i]["title"] as String,
                            year: educationItems[i]["year"] as String,
                            institution:
                                educationItems[i]["institution"] as String,
                            icon: educationItems[i]["icon"] as String,
                            url: educationItems[i]["url"] as String,
                          ),
                        ),
                        if (i < itemCount - 1) SizedBox(width: spacing),
                      ],
                    ],
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < itemCount; i++) ...[
                      EduCard(
                        title: educationItems[i]["title"] as String,
                        year: educationItems[i]["year"] as String,
                        institution: educationItems[i]["institution"] as String,
                        icon: educationItems[i]["icon"] as String,
                        url: educationItems[i]["url"] as String,
                      ),
                      if (i < itemCount - 1) SizedBox(height: spacing),
                    ],
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
