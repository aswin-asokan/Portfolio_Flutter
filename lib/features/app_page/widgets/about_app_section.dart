import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_icons/simple_icons.dart';

class AboutAppSection extends StatelessWidget {
  const AboutAppSection({
    super.key,
    required this.about,
    required this.features,
    required this.futurePlans,
    required this.infoItems,
  });

  final String about;
  final List<String> features;
  final List<String> futurePlans;
  final List<InfoModel> infoItems;

  @override
  Widget build(BuildContext context) {
    final bool isDesktopLayout = !Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.getGreenSplash(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.getGreenBorder(context),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text(
            "About this app",
            style: context.textTheme.titleMedium!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isDesktopLayout)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                // Left Column: Overview (About) & Features
                Expanded(
                  child: Column(
                    spacing: 20,
                    children: [
                      _buildOverviewCard(context),
                      _buildFeaturesCard(context),
                    ],
                  ),
                ),
                // Right Column: Future Plans & Info
                Expanded(
                  child: Column(
                    spacing: 20,
                    children: [
                      _buildFuturePlansCard(context),
                      _buildInfoCard(context),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              spacing: 20,
              children: [
                _buildOverviewCard(context),
                _buildFeaturesCard(context),
                _buildFuturePlansCard(context),
                _buildInfoCard(context),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildOverviewCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Overview",
      icon: Symbols.description,
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

  Widget _buildFeaturesCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Features",
      icon: Symbols.auto_awesome,
      iconColor: context.colorScheme.primary,
      child: _BulletList(items: features),
    );
  }

  Widget _buildFuturePlansCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Future Plans",
      icon: Symbols.target,
      iconColor: context.colorScheme.primary,
      child: _BulletList(items: futurePlans),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Info",
      icon: Symbols.info,
      iconColor: context.colorScheme.primary,
      child: _AppInfoTable(items: infoItems),
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
              Text(
                title,
                style: context.textTheme.titleMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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

class _AppInfoTable extends StatelessWidget {
  final List<InfoModel> items;
  const _AppInfoTable({required this.items});

  IconData _getLinkIcon(String url) {
    final lower = url.toLowerCase();
    if (lower.contains('github.com')) return SimpleIcons.github;
    if (lower.contains('play.google.com') || lower.contains('play.google')) return SimpleIcons.googleplay;
    if (lower.contains('apps.apple.com') || lower.contains('appstore')) return SimpleIcons.appstore;
    return SimpleIcons.googlechrome;
  }

  void _launch(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      item.title,
                      style: context.textTheme.displaySmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.getSubtitleText(context),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 6,
                    child: item.isLink
                        ? MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => _launch(item.content),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 6,
                                children: [
                                  Icon(
                                    _getLinkIcon(item.content),
                                    size: 14,
                                    color: context.colorScheme.primary,
                                  ),
                                  Flexible(
                                    child: Text(
                                      item.linkText ?? "Link",
                                      style: context.textTheme.displaySmall!.copyWith(
                                        fontSize: 13,
                                        color: context.colorScheme.primary,
                                        decoration: TextDecoration.underline,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(
                            item.content,
                            style: context.textTheme.displaySmall!.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Divider(
                color: AppColors.getDividerColor(context).withAlpha(60),
                thickness: 0.5,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
