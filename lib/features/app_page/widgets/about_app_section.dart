import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
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
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet =
        Responsive.isTablet(context) || Responsive.isSmallTablet(context);
    final bool isDesktop = !isMobile && !isTablet;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.getGreenSplash(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.getGreenBorder(context),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: AppConstants.spaceM,
            children: [
              Icon(
                Symbols.android,
                color: AppColors.aboutAppColor(context),
                size: AppConstants.iconSizeXL,
                weight: 500,
                fill: 1,
              ),
              Text(
                "About this app",
                style: context.textTheme.titleMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (isDesktop || isTablet)
            Column(
              spacing: 20,
              children: [
                // Overview gets full width to avoid needing to height-match with taller elements
                _buildOverviewCard(context),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      // Features balances against Info and Future Plans
                      Expanded(flex: 5, child: _buildFeaturesCard(context)),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 20,
                          children: [
                            _buildInfoCard(context),
                            Expanded(
                              child: _buildFuturePlansCard(context),
                            ), // Fills the tiny bit of remaining height
                          ],
                        ),
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
                _buildOverviewCard(context),
                _buildFeaturesCard(context),
                _buildInfoCard(context),
                _buildFuturePlansCard(context),
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
      child: Text(
        about,
        style: context.textTheme.displaySmall!.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildFeaturesCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Features",
      icon: Symbols.auto_awesome,
      child: _BulletList(items: features),
    );
  }

  Widget _buildFuturePlansCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Future Plans",
      icon: Symbols.target,
      child: _BulletList(items: futurePlans),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return _ProjectDetailsCard(
      title: "Info",
      icon: Symbols.info,
      child: _AppInfoTable(items: infoItems),
    );
  }
}

class _ProjectDetailsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _ProjectDetailsCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.getCardBg(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.getBorder(context), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Icon(
                icon,
                color: AppColors.aboutAppColor(context),
                size: 22,
                weight: 500,
                fill: 1,
              ),
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
      children:
          items.map((item) {
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
    if (lower.contains('play.google.com') || lower.contains('play.google'))
      return SimpleIcons.googleplay;
    if (lower.contains('apps.apple.com') || lower.contains('appstore'))
      return SimpleIcons.appstore;
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
      children:
          items.map((item) {
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
                        child:
                            item.isLink
                                ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 12,
                                  children:
                                      (item.iconLabels ?? []).map((iconLabel) {
                                        return MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (iconLabel.link != null) {
                                                _launch(iconLabel.link!);
                                              }
                                            },
                                            child: Icon(
                                              iconLabel.icon ??
                                                  _getLinkIcon(
                                                    iconLabel.link ?? '',
                                                  ),
                                              size: 20,
                                              color:
                                                  iconLabel.color ??
                                                  context.colorScheme.primary,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                )
                                : Text(
                                  item.content ?? '',
                                  style: context.textTheme.displaySmall!
                                      .copyWith(
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
