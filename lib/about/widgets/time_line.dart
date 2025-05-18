import 'package:flutter/material.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key, required this.institution, required this.details});
  final String institution;
  final String details;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(color: context.colorScheme.primary, width: 2, height: 80),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(200),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(institution, style: context.textTheme.bodyMedium),
            Text(details, style: context.textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
