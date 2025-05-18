import 'package:flutter/material.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';

class SkillTile extends StatelessWidget {
  const SkillTile({
    super.key,
    required this.title,
    required this.skills,
    required this.icon,
  });
  final String title;
  final String skills;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 230,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 45, color: context.colorScheme.primary),
          Text(title, style: context.textTheme.bodyMedium),
          Text(skills, style: context.textTheme.bodySmall),
        ],
      ),
    );
  }
}
