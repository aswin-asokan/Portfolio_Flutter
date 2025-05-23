import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/hero/widgets/skill_tile.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class HeroRight extends StatelessWidget {
  HeroRight({super.key});
  final List<Map<String, dynamic>> skills = [
    {"title": "Frontend", "skills": "Flutter, React", "icon": Symbols.code},
    {"title": "Backend", "skills": "Python", "icon": Symbols.storage},
    {
      "title": "Database",
      "skills": "Firebase, MySQL",
      "icon": Symbols.database_rounded,
    },
    {
      "title": "Tools",
      "skills": "Git, Atlassian's platform",
      "icon": Symbols.service_toolbox,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      height:
          Responsive.isMobile(context)
              ? 740
              : Responsive.isSmallTablet(context)
              ? 500
              : double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius:
            Responsive.isMobile(context) || Responsive.isSmallTablet(context)
                ? BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
                : BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SelectableText("Hi I'm ", style: context.textTheme.titleMedium),
              SelectableText(
                "Aswin",
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          SelectableText(
            "I am a self-taught application developer passionate about creative problem-solving. I also love to draw while enjoying music. As a student, I am dedicated to pursuing my dreams and expanding my skills.",
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          if (Responsive.isDesktopLarge(context) ||
              Responsive.isDesktop(context) ||
              Responsive.isSmallTablet(context))
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: List.generate(2, (index) {
                    return SkillTile(
                      title: skills[index]["title"],
                      skills: skills[index]["skills"],
                      icon: skills[index]["icon"],
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  // Spacing between SkillTiles in the second row.
                  children: List.generate(2, (index) {
                    final actualIndex = index + skills.length - 2;
                    return SkillTile(
                      title: skills[actualIndex]["title"],
                      skills: skills[actualIndex]["skills"],
                      icon: skills[actualIndex]["icon"],
                    );
                  }),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: List.generate(skills.length, (index) {
                return skillTileTab(
                  title: skills[index]["title"],
                  skills: skills[index]["skills"],
                  icon: skills[index]["icon"],
                );
              }),
            ),
        ],
      ),
    );
  }
}
