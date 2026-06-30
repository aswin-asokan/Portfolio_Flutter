import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/pinterest/widgets/iframe_widget.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/corner_star.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:portfolio/features/pinterest/widgets/anime_easter_egg.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class PinterestSection extends StatelessWidget {
  final VoidCallback? onEasterEggPressed;
  const PinterestSection({super.key, this.onEasterEggPressed});

  final String _pinterestUrl = "https://pin.it/416Oj6Tmc";

  String _getPinterestDataUrl(bool isDark) {
    final scrollbarColor =
        isDark ? "rgba(255, 255, 255, 0.2)" : "rgba(0, 0, 0, 0.2)";
    final htmlContent = '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      background-color: transparent;
      overflow: hidden;
    }
    /* Hide scrollbars or make them sleek */
    ::-webkit-scrollbar {
      width: 4px;
    }
    ::-webkit-scrollbar-track {
      background: transparent;
    }
    ::-webkit-scrollbar-thumb {
      background: $scrollbarColor;
      border-radius: 2px;
    }
    .pinterest-container {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      width: 100%;
      height: 100%;
      margin: 0;
      padding: 0;
      overflow: hidden;
      box-sizing: border-box;
    }
    /* Target only the top-level span and iframe created by pinit.js to make it full screen and remove card styles */
    .PIN_embed_grid,
    .PIN_embed_grid > iframe {
      width: 100% !important;
      height: 100% !important;
      max-width: 100% !important;
      max-height: 100% !important;
      margin: 0 !important;
      padding: 0 !important;
      border: none !important;
      border-radius: 0 !important;
      box-shadow: none !important;
      background: transparent !important;
    }
  </style>
</head>
<body>
  <div class="pinterest-container">
    <a data-pin-do="embedUser" data-pin-board-width="300" data-pin-scale-width="240" data-pin-scale-height="320" href="https://www.pinterest.com/ArtMyDay/"></a>
  </div>
  <script async defer src="https://assets.pinterest.com/js/pinit.js"></script>
</body>
</html>
''';
    return "data:text/html;charset=utf-8,${Uri.encodeComponent(htmlContent)}";
  }

  Future<void> _launchPinterest() async {
    final url = Uri.parse(_pinterestUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final double width = MediaQuery.sizeOf(context).width;
    final bool isDesktopLayout =
        width >= AppConstants.pinterestDesktopBreakpoint;
    final bool isMobileLayout = width < AppConstants.pinterestMobileBreakpoint;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.getLavenderBg(context),
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        border: Border.all(
          color:
              isDark
                  ? AppColors.primaryPurpleDark.withValues(alpha: 0.2)
                  : AppColors.primaryPurple.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (!isMobileLayout) {
            final double mockupColumnWidth =
                constraints.maxWidth * (isDesktopLayout ? 0.32 : 0.45);
            final double mockupWidth = (mockupColumnWidth - AppConstants.spaceM)
                .clamp(
                  AppConstants.pinterestMockupWidthMin,
                  AppConstants.pinterestMockupWidthMax,
                );

            return _buildHorizontalLayout(
              context,
              isDark,
              isDesktop: isDesktopLayout,
              mockupWidth: mockupWidth,
            );
          } else {
            return _buildStackedLayout(context, isDark, isMobileLayout);
          }
        },
      ),
    );
  }

  Widget _buildHorizontalLayout(
    BuildContext context,
    bool isDark, {
    required bool isDesktop,
    required double mockupWidth,
  }) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double leftPadding =
        screenWidth < AppConstants.pinterestResponsiveTitleBreakpoint
            ? AppConstants.pinterestPaddingLeftSmall
            : AppConstants.pinterestPaddingLeftLarge;
    final double rightPadding =
        screenWidth < AppConstants.pinterestResponsiveTitleBreakpoint
            ? AppConstants.pinterestPaddingRightSmall
            : AppConstants.pinterestPaddingRightLarge;
    final double titleFontSize =
        screenWidth < AppConstants.pinterestResponsiveTitleBreakpoint
            ? AppConstants.pinterestTitleFontSizeTablet
            : AppConstants.pinterestTitleFontSizeDesktop;
    final double descFontSize =
        screenWidth < AppConstants.pinterestResponsiveTitleBreakpoint
            ? AppConstants.pinterestDescFontSizeTablet
            : AppConstants.pinterestDescFontSizeDesktop;

    return SizedBox(
      height: AppConstants.pinterestMockupHeightHorizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left text content
          Expanded(
            flex: isDesktop ? 38 : 55,
            child: Padding(
              padding: EdgeInsets.fromLTRB(leftPadding, 16, rightPadding, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    spacing: AppConstants.spaceS,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AnimeEasterEgg(
                        onTap: onEasterEggPressed,
                        height: AppConstants.iconSize68,
                      ),
                      CornerStars(
                        position: StarPosition.topRight,
                        child: Text(
                          "My Art & Crafts",
                          style: context.textTheme.labelLarge!.copyWith(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColors.getTitleText(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spaceM),
                  Text(
                    "A little corner of my world where ideas take shape beyond the screen. Sketches, illustrations, and handmade things I love creating.",
                    style: context.textTheme.bodySmall!.copyWith(
                      color: AppColors.getDescriptionText(context),
                      fontSize: descFontSize,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spaceL),
                  CustomButton.filled(
                    color: isDark ? AppColors.white : AppColors.darkButton,
                    textColor: isDark ? AppColors.black : AppColors.white,
                    label: "Explore on Pinterest",
                    prefixIcon: Icon(
                      SimpleIcons.pinterest,
                      size: AppConstants.pinterestIconSize,
                      color: isDark ? AppColors.black : AppColors.white,
                    ),
                    onPress: _launchPinterest,
                  ),
                ],
              ),
            ),
          ),

          // Combined Middle & Right area
          Expanded(
            flex: isDesktop ? 62 : 45,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (!isDesktop) {
                  // Tablet layout (Middle mockup only)
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: -20,
                        bottom: -20,
                        width: mockupWidth,
                        child: _buildTabletMockup(
                          context,
                          isDark,
                          bottomOffset: 20.0,
                        ),
                      ),
                    ],
                  );
                } else {
                  // Desktop layout: character placed relative to the phone mockup frame
                  final double totalWidth = constraints.maxWidth;
                  final double middleWidth = totalWidth * (32 / 62);
                  final double mockupLeft = (middleWidth - mockupWidth) / 2;

                  // Position the character so that the left edge of the image is close to/overlaps the mockup slightly
                  final double characterLeft = mockupLeft + mockupWidth + 60;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Layer 1: Character (Behind mockup for safety)
                      Positioned(
                        left: characterLeft,
                        bottom: 15,
                        height: 270,
                        child: Image.asset(
                          "assets/images/pinterest/pin_img.webp",
                          cacheWidth: 800,
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomRight,
                          filterQuality: FilterQuality.high,
                          gaplessPlayback: true,
                        ),
                      ),
                      // Layer 2: Phone Mockup (On top of character)
                      Positioned(
                        left: mockupLeft,
                        top: -20,
                        bottom: -20,
                        width: mockupWidth,
                        child: _buildTabletMockup(
                          context,
                          isDark,
                          bottomOffset: 20.0,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStackedLayout(BuildContext context, bool isDark, bool isMobile) {
    final double deviceWidth =
        isMobile
            ? AppConstants.pinterestDeviceWidthMobile
            : AppConstants.pinterestDeviceWidthTablet;
    final double deviceHeight =
        isMobile
            ? AppConstants.pinterestDeviceHeightMobile
            : AppConstants.pinterestDeviceHeightTablet;
    final double hiddenBottom = isMobile ? deviceHeight * 0.25 : 0.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMobile ? AppConstants.spaceL : AppConstants.spaceXL + 8.0,
        AppConstants.spaceXL,
        isMobile ? AppConstants.spaceL : AppConstants.spaceXL + 8.0,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: AppConstants.spaceS,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimeEasterEgg(
                onTap: onEasterEggPressed,
                height: AppConstants.iconSize68,
              ),
              CornerStars(
                position: StarPosition.topRight,
                child: Text(
                  "My Art & Crafts",
                  style: context.textTheme.labelLarge!.copyWith(
                    fontSize: AppConstants.pinterestTitleFontSizeMobile,
                    fontWeight: FontWeight.bold,
                    color: AppColors.getTitleText(context),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spaceM),
          Text(
            "A little corner of my world where ideas take shape beyond the screen. Sketches, illustrations, and handmade things I love creating.",
            style: context.textTheme.bodySmall!.copyWith(
              color: AppColors.getDescriptionText(context),
              fontSize: AppConstants.pinterestDescFontSizeMobile,
              height: 1.6,
            ),
          ),
          const SizedBox(height: AppConstants.techSectionPadding),
          CustomButton.filled(
            color: isDark ? AppColors.white : AppColors.darkButton,
            textColor: isDark ? AppColors.black : AppColors.white,
            label: "Explore on Pinterest",
            prefixIcon: Icon(
              SimpleIcons.pinterest,
              size: AppConstants.pinterestIconSize,
              color: isDark ? AppColors.black : AppColors.white,
            ),
            onPress: _launchPinterest,
          ),
          const SizedBox(height: AppConstants.spaceXL),
          Center(
            child: SizedBox(
              width: deviceWidth,
              height: deviceHeight - hiddenBottom,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: deviceHeight,
                    child: _buildTabletMockup(
                      context,
                      isDark,
                      bottomOffset: hiddenBottom - 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletMockup(
    BuildContext context,
    bool isDark, {
    double bottomOffset = 0.0,
  }) {
    final buttonColor = AppColors.getMockupButton(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Volume buttons
        Positioned(
          left: -5,
          top: 120,
          child: _sideButton(
            height: AppConstants.pinterestMockupButtonHeight,
            color: buttonColor,
          ),
        ),
        Positioned(
          left: -5,
          top: 170,
          child: _sideButton(
            height: AppConstants.pinterestMockupButtonHeight,
            color: buttonColor,
          ),
        ),

        // Power button
        Positioned(
          right: -5,
          top: 120,
          child: _sideButton(
            height: AppConstants.pinterestMockupButtonHeight,
            color: buttonColor,
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: AppColors.getMockupDeviceBg(context),
            borderRadius: BorderRadius.circular(
              AppConstants.pinterestMockupBorderRadius,
            ),
            border: Border.all(
              color: AppColors.getMockupDeviceBorder(context),
              width: AppConstants.pinterestMockupBorderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.only(top: AppConstants.spaceS),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                AppConstants.pinterestMockupInnerRadius,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: IFrameWidget(
                      viewId: "pinterest-profile-view",
                      url: _getPinterestDataUrl(isDark),
                      placeholder: _buildPinterestPlaceholder(context, isDark),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.getMockupDeviceBg(
                              context,
                            ).withValues(alpha: 0.0),
                            AppColors.getMockupDeviceBg(
                              context,
                            ).withValues(alpha: 0.85),
                            AppColors.getMockupDeviceBg(context),
                          ],
                          stops: const [0.0, 0.35, 1.0],
                        ),
                      ),
                      padding: EdgeInsets.only(
                        top: AppConstants.spaceM,
                        bottom: AppConstants.spaceS + bottomOffset,
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: _launchPinterest,
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusS,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.spaceM,
                              vertical: AppConstants.spaceXS + 2.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Visit Profile, View All",
                                  style: context.textTheme.bodySmall!.copyWith(
                                    color: const Color(0xFFE60023),
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppConstants.fontS,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                const SizedBox(width: AppConstants.spaceXS),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFE60023),
                                  size: AppConstants.fontXS,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _sideButton({required double height, required Color color}) {
    return Container(
      width: 5,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildPinterestPlaceholder(BuildContext context, bool isDark) {
    return Container(
      color: isDark ? const Color(0xFF13131A) : const Color(0xFFFAFAFA),
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          // Masonry skeleton grid representation
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Opacity(
                opacity: isDark ? 0.08 : 0.12,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _skeletonCard(height: 80),
                          const SizedBox(height: 8),
                          _skeletonCard(height: 120),
                          const SizedBox(height: 8),
                          _skeletonCard(height: 70),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        children: [
                          _skeletonCard(height: 110),
                          const SizedBox(height: 8),
                          _skeletonCard(height: 70),
                          const SizedBox(height: 8),
                          _skeletonCard(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Central interactive prompt
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.75)
                    : Colors.white.withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.05),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE60023),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      SimpleIcons.pinterest,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Art & Crafts",
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.getTitleText(context),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Pinterest Feed",
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 9,
                      color: AppColors.getDescriptionText(context).withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _skeletonCard({required double height}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
