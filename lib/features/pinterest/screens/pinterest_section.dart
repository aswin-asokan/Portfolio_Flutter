import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/pinterest/widgets/iframe_widget.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class PinterestSection extends StatelessWidget {
  const PinterestSection({super.key});

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
  </style>
</head>
<body>
  <div style="display: flex; justify-content: center; align-items: flex-start; width: 100%; height: 100%; overflow: hidden; padding-bottom: 100px; box-sizing: border-box;">
    <a data-pin-do="embedUser" data-pin-board-width="220" data-pin-scale-width="140" data-pin-scale-height="285" href="https://www.pinterest.com/ArtMyDay/"></a>
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
    final bool isDesktopLayout = width >= 1150;
    final bool isMobileLayout = width < 600;

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
            final double mockupWidth = (mockupColumnWidth - 16).clamp(
              200.0,
              300.0,
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
    final double leftPadding = screenWidth < 850 ? 24.0 : 48.0;
    final double rightPadding = screenWidth < 850 ? 12.0 : 20.0;
    final double titleFontSize = screenWidth < 850 ? 22.0 : 28.0;
    final double descFontSize = screenWidth < 850 ? 12.0 : 14.0;

    return SizedBox(
      height: 300,
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
                  CornerHighlight(
                    corner: SparkleCorner.topRight,
                    color: AppColors.sparklePink,
                    lengthFactor: 1.1,
                    child: Text(
                      "My Art & Crafts",
                      style: context.textTheme.labelLarge!.copyWith(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.getTitleText(context),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "A little corner of my world where ideas take shape beyond the screen. Sketches, illustrations, and handmade things I love creating.",
                    style: context.textTheme.bodySmall!.copyWith(
                      color: AppColors.getDescriptionText(context),
                      fontSize: descFontSize,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton.filled(
                    color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                    textColor: isDark ? Colors.black : Colors.white,
                    label: "Explore on Pinterest",
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/pinterest.svg",
                      height: 18,
                      colorFilter: ColorFilter.mode(
                        isDark ? Colors.black : Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPress: _launchPinterest,
                  ),
                ],
              ),
            ),
          ),

          // Middle: Arrow & Phone Mockup
          Expanded(
            flex: isDesktop ? 32 : 45,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -20,
                  bottom: -20,
                  width: mockupWidth,
                  child: _buildTabletMockup(context, isDark),
                ),
              ],
            ),
          ),

          // Right: Cartoon winking avatar & thought bubble (Only on desktop!)
          if (isDesktop)
            Expanded(
              flex: 30,
              child: Stack(
                children: [
                  // Thought bubble
                  Positioned(
                    left: 15,
                    top: 42,
                    child: _buildThoughtBubble(context, isDark),
                  ),
                  // Floating Pink Heart
                  Positioned(
                    right: 40,
                    bottom: 120,
                    child: Icon(
                      Symbols.favorite,
                      fill: 1.0,
                      weight: 700,
                      size: 32,
                      color: AppColors.sparklePink,
                    ),
                  ),
                  // Character image peeking from bottom-right
                  Positioned(
                    right: -15,
                    bottom: -18,
                    height: 220,
                    child: Image.asset(
                      "assets/images/about/about_image.webp",
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStackedLayout(BuildContext context, bool isDark, bool isMobile) {
    final double deviceWidth = isMobile ? 254 : 310;
    final double deviceHeight = isMobile ? 350 : 360;
    final double hiddenBottom = isMobile ? deviceHeight * 0.25 : 0;

    return SizedBox(
      height: 500,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              isMobile ? 24.0 : 40.0,
              32.0,
              isMobile ? 24.0 : 40.0,
              isMobile ? 170.0 : 56.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CornerHighlight(
                  corner: SparkleCorner.topRight,
                  color: AppColors.sparklePink,
                  lengthFactor: 1.1,
                  child: Text(
                    "My Art & Crafts",
                    style: context.textTheme.labelLarge!.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.getTitleText(context),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "A little corner of my world where ideas take shape beyond the screen. Sketches, illustrations, and handmade things I love creating.",
                  style: context.textTheme.bodySmall!.copyWith(
                    color: AppColors.getDescriptionText(context),
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton.filled(
                  color: isDark ? Colors.white : const Color(0xFF1A1A1A),
                  textColor: isDark ? Colors.black : Colors.white,
                  label: "Explore on Pinterest",
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/pinterest.svg",
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      isDark ? Colors.black : Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPress: _launchPinterest,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -hiddenBottom,
            child: Center(
              child: SizedBox(
                width: deviceWidth,
                height: deviceHeight,
                child: _buildTabletMockup(context, isDark),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletMockup(BuildContext context, bool isDark) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Volume buttons
        Positioned(
          left: -5,
          top: 120,
          child: _sideButton(
            height: 42,
            color: isDark ? Colors.black87 : Colors.grey.shade800,
          ),
        ),
        Positioned(
          left: -5,
          top: 170,
          child: _sideButton(
            height: 42,
            color: isDark ? Colors.black87 : Colors.grey.shade800,
          ),
        ),

        // Power button
        Positioned(
          right: -5,
          top: 120,
          child: _sideButton(
            height: 42,
            color: isDark ? Colors.black87 : Colors.grey.shade800,
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF101018) : Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: isDark ? Colors.white24 : Colors.black87,
              width: 7,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.only(top: AppConstants.spaceS),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
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

  Widget _buildThoughtBubble(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2E2E3A) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? Colors.white30 : Colors.black87,
              width: 2.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            "Art feeds\nthe code.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              fontFamily: 'monospace',
              color: isDark ? Colors.white : Colors.black87,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 6),
        // Thought bubble small tail circles
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2E2E3A) : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDark ? Colors.white30 : Colors.black87,
                    width: 1.5,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2E2E3A) : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDark ? Colors.white30 : Colors.black87,
                    width: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
