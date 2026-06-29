import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';

class SplashCardItem {
  final Widget icon;
  final String title;
  final String subtitle;

  const SplashCardItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class AboutSplashCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget image;
  final List<SplashCardItem> items;

  const AboutSplashCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = AppColors.getGreenBorder(context);
    final splashColor = AppColors.getGreenSplash(context);
    final itemsBgColor = Theme.of(context).colorScheme.surface;
    final itemsBorderColor = AppColors.getBorder(context);
    final textColor = Theme.of(context).colorScheme.onSurface;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        // If space is there (desktop / landscape tablet), show in single row
        if (width >= AppConstants.aboutTabletBreakpoint) {
          return buildRowLayout(
            context,
            width,
            borderColor,
            splashColor,
            textColor,
            isDark,
          );
        } else {
          // If not enough space, show stacked layout (about container top, items container bottom)
          return buildStackedLayout(
            context,
            width,
            borderColor,
            splashColor,
            itemsBgColor,
            itemsBorderColor,
            textColor,
            isDark,
          );
        }
      },
    );
  }

  Widget buildRowLayout(
    BuildContext context,
    double width,
    Color borderColor,
    Color splashColor,
    Color textColor,
    bool isDark,
  ) {
    return Container(
      width: double.infinity,
      height: AppConstants.aboutCardHeightRow,
      decoration: BoxDecoration(
        color: AppColors.getCardBg(context),
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Green Splash Background
          Positioned.fill(
            child: ClipPath(
              clipper: SplashClipper(ratio: 0.38),
              child: Container(color: splashColor),
            ),
          ),
          // Content Layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. About text
              Expanded(
                flex: 33,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 24, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CornerHighlight(
                        corner: SparkleCorner.topLeft,
                        color:
                            isDark ? AppColors.lightGreen : AppColors.darkGreen,
                        child: Text(
                          title,
                          style: context.textTheme.labelLarge!.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Text(
                          description,
                          style: context.textTheme.bodySmall!.copyWith(
                            color: AppColors.getDescriptionText(context),
                            fontSize: 14,
                            height: 1.5,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 2. Character Image
              Expanded(
                flex: 16,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0.5),
                    child: image,
                  ),
                ),
              ),
              // 3. Info Items
              Expanded(
                flex: 42,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      for (int i = 0; i < items.length; i++) ...[
                        Expanded(
                          child: SplashItemWidget(
                            item: items[i],
                            isDark: isDark,
                          ),
                        ),
                        if (i < items.length - 1)
                          Container(
                            width: 1,
                            height: 70,
                            color: AppColors.getDividerColor(context),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                          ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStackedLayout(
    BuildContext context,
    double width,
    Color borderColor,
    Color splashColor,
    Color itemsBgColor,
    Color itemsBorderColor,
    Color textColor,
    bool isDark,
  ) {
    final bool isMobile = width < AppConstants.aboutMobileBreakpoint;

    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Container: About
        Container(
          width: double.infinity,
          height: isMobile ? null : AppConstants.aboutCardHeightStacked,
          decoration: BoxDecoration(
            color: AppColors.getCardBg(context),
            borderRadius: BorderRadius.circular(AppConstants.radiusXL),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              // Splash Background
              Positioned.fill(
                child: ClipPath(
                  clipper: SplashClipper(ratio: isMobile ? 0.74 : 0.78),
                  child: Container(color: splashColor),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: isMobile ? 1 : 70,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        40,
                        24,
                        isMobile ? 32 : 16,
                        24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize:
                            isMobile ? MainAxisSize.min : MainAxisSize.max,
                        children: [
                          CornerHighlight(
                            corner: SparkleCorner.topLeft,
                            color:
                                isDark
                                    ? AppColors.lightGreen
                                    : AppColors.darkGreen,
                            lengthFactor: 0.7,
                            child: Text(
                              title,
                              style: context.textTheme.labelLarge!.copyWith(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (isMobile)
                            Text(
                              description,
                              style: context.textTheme.bodySmall!.copyWith(
                                color: AppColors.getDescriptionText(context),
                                fontSize: 14,
                                height: 1.5,
                              ),
                            )
                          else
                            Expanded(
                              child: Text(
                                description,
                                style: context.textTheme.bodySmall!.copyWith(
                                  color: AppColors.getDescriptionText(context),
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (!isMobile)
                    Expanded(
                      flex: 30,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: image,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        // Bottom Container: Items
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: itemsBgColor,
            borderRadius: BorderRadius.circular(AppConstants.radiusXL),
            border: Border.all(color: itemsBorderColor, width: 1.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: LayoutBuilder(
            builder: (context, itemConstraints) {
              final itemWidth = itemConstraints.maxWidth;
              if (itemWidth < 500) {
                // If extremely narrow, show vertical layout or 2x2 grid
                return Column(
                  spacing: 16,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SplashItemWidget(
                            item: items[0],
                            isDark: isDark,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 50,
                          color: AppColors.getDividerColor(context),
                        ),
                        Expanded(
                          child: SplashItemWidget(
                            item: items[1],
                            isDark: isDark,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColors.getGridDivider(context)),
                    Row(
                      children: [
                        Expanded(
                          child: SplashItemWidget(
                            item: items[2],
                            isDark: isDark,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 50,
                          color: AppColors.getDividerColor(context),
                        ),
                        Expanded(
                          child: SplashItemWidget(
                            item: items[3],
                            isDark: isDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                // Horizontal items
                return Row(
                  children: [
                    for (int i = 0; i < items.length; i++) ...[
                      Expanded(
                        child: SplashItemWidget(item: items[i], isDark: isDark),
                      ),
                      if (i < items.length - 1)
                        Container(
                          width: 1,
                          height: 60,
                          color: AppColors.getDividerColor(context),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                        ),
                    ],
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class SplashItemWidget extends StatefulWidget {
  final SplashCardItem item;
  final bool isDark;

  const SplashItemWidget({super.key, required this.item, required this.isDark});

  @override
  State<SplashItemWidget> createState() => _SplashItemWidgetState();
}

class _SplashItemWidgetState extends State<SplashItemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.item.title,
            style: context.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.getTitleText(context),
            ),
          ),
          const SizedBox(height: 12),
          // Playful hover animated icon wrapper
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutBack,
            transform:
                _isHovered
                    ? Matrix4.translationValues(0, -6, 0)
                    : Matrix4.identity(),
            child: AnimatedScale(
              scale: _isHovered ? 1.12 : 1.0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              child: AnimatedRotation(
                turns: _isHovered ? 0.02 : 0.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: widget.item.icon,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.item.subtitle,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 13,
              color: AppColors.getSubtitleText(context),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class SplashClipper extends CustomClipper<Path> {
  final double ratio;

  SplashClipper({required this.ratio});

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height);

    // Bottom is narrower
    final bottomX = size.width * ratio;
    final topX = size.width * (ratio + 0.09);

    path.lineTo(bottomX, size.height);

    // More pronounced S-shaped curve
    path.cubicTo(
      bottomX - AppConstants.splashMaxAmplitude,
      size.height * 0.75,
      topX + AppConstants.splashMaxAmplitude,
      size.height * 0.25,
      topX,
      0,
    );

    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant SplashClipper oldClipper) =>
      oldClipper.ratio != ratio;
}
