import 'package:flutter/material.dart';
import 'package:portfolio/about/widgets/time_line.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colorScheme.secondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Education",
            style: context.textTheme.labelMedium!.copyWith(fontSize: 30),
          ),
          SizedBox(height: 10),
          TimeLine(
            institution: "MACE, Kothamanagalam",
            details: "Btech in CSE, 2023 - Present",
          ),
          TimeLine(
            institution: "GPC, Kalamassery",
            details: "Diploma in CSE, 2020 - 2023",
          ),
        ],
      ),
    );
  }
}
