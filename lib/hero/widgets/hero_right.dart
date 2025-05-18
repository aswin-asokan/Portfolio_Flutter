import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/hero/widgets/skill_tile.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';

class HeroRight extends StatelessWidget {
  const HeroRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      height: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("Hi I'm ", style: context.textTheme.titleMedium),
              Text(
                "Aswin",
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          Text(
            "I am a self-taught application developer passionate about creative problem-solving. I also love to draw while enjoying music. As a student, I am dedicated to pursuing my dreams and expanding my skills.",
            style: context.textTheme.bodySmall,
          ),
          Row(
            spacing: 20,
            children: [
              SkillTile(
                title: "Frontend",
                skills: "Flutter, React",
                icon: Symbols.code,
              ),
              SkillTile(
                title: "Backend",
                skills: "Python",
                icon: Symbols.storage,
              ),
            ],
          ),
          Row(
            spacing: 20,
            children: [
              SkillTile(
                title: "Mobile",
                skills: "Flutter",
                icon: Symbols.phone_android,
              ),
              SkillTile(
                title: "Database",
                skills: "Firebase, MySQL",
                icon: Symbols.database_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
