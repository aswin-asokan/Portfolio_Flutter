import 'package:flutter/material.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

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
      height: Responsive.isDesktop(context) ? 150 : 130,
      width: Responsive.isSmallTablet(context) ? 300 : 230,
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
          SelectableText(title, style: context.textTheme.bodyMedium),
          SelectableText(skills, style: context.textTheme.bodySmall),
        ],
      ),
    );
  }
}

class SkillTileTab extends StatelessWidget {
  const SkillTileTab({
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
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          Icon(
            icon,
            size: Responsive.isMobile(context) ? 45 : 60,
            color: context.colorScheme.primary,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              SelectableText(title, style: context.textTheme.bodyMedium),
              SelectableText(skills, style: context.textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
