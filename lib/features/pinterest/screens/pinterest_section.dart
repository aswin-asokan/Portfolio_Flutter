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
              padding: EdgeInsets.fromLTRB(leftPadding, 20, rightPadding, 20),
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
                        child: _buildTabletMockup(context, isDark),
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
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomRight,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      // Layer 2: Phone Mockup (On top of character)
                      Positioned(
                        left: mockupLeft,
                        top: -20,
                        bottom: -20,
                        width: mockupWidth,
                        child: _buildTabletMockup(context, isDark),
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
                    child: _buildTabletMockup(context, isDark),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletMockup(BuildContext context, bool isDark) {
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
              child: IFrameWidget(
                viewId: "pinterest-profile-view",
                url: _getPinterestDataUrl(isDark),
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
}
