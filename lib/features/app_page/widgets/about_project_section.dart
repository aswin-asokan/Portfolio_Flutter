import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/widgets/tech_icon_helper.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class AboutProjectSection extends StatelessWidget {
  const AboutProjectSection({
    super.key,
    required this.about,
    required this.challenges,
    required this.outcomes,
    required this.infoItems,
  });

  final String about;
  final List<String> challenges;
  final List<String> outcomes;
  final List<InfoModel> infoItems;

  @override
  Widget build(BuildContext context) {
    final bool isDesktopLayout = !Responsive.isMobile(context);

    // Find the items dynamically by title to ensure robust mapping
    final techStackItem = infoItems.firstWhere(
      (e) => e.title.toLowerCase().contains('stack'),
      orElse: () => InfoModel(title: "Tech Stack", content: ""),
    );
    final toolsItem = infoItems.firstWhere(
      (e) => e.title.toLowerCase().contains('tool') || e.title.toLowerCase().contains('services'),
      orElse: () => InfoModel(title: "Tools & Services", content: ""),
    );
    final skillsItem = infoItems.firstWhere(
      (e) => e.title.toLowerCase().contains('skill'),
      orElse: () => InfoModel(title: "Skills", content: ""),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.getLavenderBg(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.getBorder(context),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text(
            "About this project",
            style: context.textTheme.titleMedium!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isDesktopLayout)
            Column(
              spacing: 20,
              children: [
                // Row 1: Why I built this, Challenges faced, Learning / Outcome
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      Expanded(
                        child: _buildWhyIBuiltCard(context),
                      ),
                      Expanded(
                        child: _buildChallengesCard(context),
                      ),
                      Expanded(
                        child: _buildLearningCard(context),
                      ),
                    ],
                  ),
                ),
                // Row 2: Tech Stack, Tools & Services, Skills
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      Expanded(
                        child: _buildTechStackCard(context, techStackItem.content),
                      ),
                      Expanded(
                        child: _buildToolsCard(context, toolsItem.content),
                      ),
                      Expanded(
                        child: _buildSkillsCard(context, skillsItem.content),
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              spacing: 20,
              children: [
                _buildWhyIBuiltCard(context),
                _buildChallengesCard(context),
                _buildLearningCard(context),
                _buildTechStackCard(context, techStackItem.content),
                _buildToolsCard(context, toolsItem.content),
                _buildSkillsCard(context, skillsItem.content),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildWhyIBuiltCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Why I built this",
      icon: Symbols.lightbulb,
      iconColor: context.colorScheme.primary,
      child: Text(
        about,
        style: context.textTheme.displaySmall!.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          height: 1.5,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildChallengesCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Challenges faced",
      icon: Symbols.warning,
      iconColor: context.colorScheme.primary,
      child: _BulletList(items: challenges),
    );
  }

  Widget _buildLearningCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Learning / Outcome",
      icon: Symbols.school,
      iconColor: context.colorScheme.primary,
      child: _BulletList(items: outcomes),
    );
  }

  Widget _buildTechStackCard(BuildContext context, String content) {
    return _ProjectDetailsCard(
      title: "Tech Stack",
      icon: Symbols.construction,
      iconColor: context.colorScheme.primary,
      child: _TechIconGrid(content: content),
    );
  }

  Widget _buildToolsCard(BuildContext context, String content) {
    return _ProjectDetailsCard(
      title: "Tools & Services",
      icon: Symbols.handyman,
      iconColor: context.colorScheme.primary,
      child: _TechIconGrid(content: content),
    );
  }

  Widget _buildSkillsCard(BuildContext context, String content) {
    return _ProjectDetailsCard(
      title: "Skills",
      icon: Symbols.star,
      iconColor: context.colorScheme.primary,
      child: _TechIconGrid(content: content),
    );
  }
}

class _ProjectDetailsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Widget child;

  const _ProjectDetailsCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.getCardBg(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.getBorder(context),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            spacing: 8,
            children: [
              Icon(icon, color: iconColor, size: 20),
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;
  const _BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• ",
                style: context.textTheme.displaySmall!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: context.textTheme.displaySmall!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _TechIconGrid extends StatelessWidget {
  final String content;
  const _TechIconGrid({required this.content});

  @override
  Widget build(BuildContext context) {
    final items = content
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.start,
      children: items.map((item) {
        final icon = getTechIcon(item);
        final color = getTechColor(item) ?? context.colorScheme.primary;
        return SizedBox(
          width: 70,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Icon(icon, size: 24, color: color)
              else
                Icon(Symbols.code, size: 24, color: color),
              const SizedBox(height: 6),
              Text(
                item,
                style: context.textTheme.displaySmall!.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
