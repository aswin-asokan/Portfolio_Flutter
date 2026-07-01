import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/pinterest/widgets/iframe_widget.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:portfolio/features/shared/widgets/corner_star.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:portfolio/features/shared/widgets/pixel_tooltip_bubble.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AnilistSection extends StatelessWidget {
  final VoidCallback? onClosePressed;
  const AnilistSection({super.key, this.onClosePressed});

  final String _anilistUrl = "https://anilist.co/user/alphaknight29/animelist";

  String _getAnilistDataUrl() {
    final htmlContent = '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      background-color: #0b1622; /* AniList dark background */
      color: #f0f3f6;
      font-family: 'Inter', sans-serif;
      overflow-x: hidden;
    }
    /* Sleek custom scrollbars */
    ::-webkit-scrollbar {
      width: 4px;
    }
    ::-webkit-scrollbar-track {
      background: transparent;
    }
    ::-webkit-scrollbar-thumb {
      background: rgba(255, 255, 255, 0.15);
      border-radius: 2px;
    }
    .header {
      padding: 12px;
      background: #152232;
      border-bottom: 1px solid rgba(255, 255, 255, 0.05);
      display: flex;
      align-items: center;
      gap: 10px;
      position: sticky;
      top: 0;
      z-index: 10;
    }
    .avatar {
      width: 32px;
      height: 32px;
      border-radius: 50%;
      border: 1.5px solid #3db4f2;
      object-fit: cover;
    }
    .user-info {
      flex: 1;
      min-width: 0;
    }
    .username {
      font-size: 12px;
      font-weight: 700;
      margin: 0;
      color: #3db4f2;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    .sub {
      font-size: 9px;
      color: #8596a5;
      margin: 0;
    }
    .content {
      padding: 10px;
      display: flex;
      flex-direction: column;
      gap: 12px;
    }
    .section-title {
      font-size: 10px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.8px;
      color: #8596a5;
      margin-bottom: 6px;
      border-left: 2.5px solid #3db4f2;
      padding-left: 6px;
    }
    .list-container {
      display: flex;
      flex-direction: column;
      gap: 6px;
    }
    .anime-card {
      display: flex;
      gap: 8px;
      background: #152232;
      border-radius: 6px;
      padding: 6px;
      align-items: center;
    }
    .cover-img {
      width: 30px;
      height: 42px;
      border-radius: 3px;
      object-fit: cover;
      background-color: #0b1622;
    }
    .anime-details {
      flex: 1;
      min-width: 0;
    }
    .anime-title {
      font-size: 10px;
      font-weight: 600;
      margin: 0;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      color: #f0f3f6;
    }
    .progress-bar {
      height: 3px;
      background: rgba(255, 255, 255, 0.08);
      border-radius: 1.5px;
      margin-top: 5px;
      overflow: hidden;
    }
    .progress-fill {
      height: 100%;
      background: #3db4f2;
      border-radius: 1.5px;
    }
    .progress-text {
      font-size: 8px;
      color: #8596a5;
      margin-top: 3px;
      display: flex;
      justify-content: space-between;
    }
    .score {
      color: #10b981;
      font-weight: bold;
    }
    .loading {
      text-align: center;
      padding: 30px;
      color: #8596a5;
      font-size: 11px;
    }
  </style>
</head>
<body>
  <div class="header">
    <img id="avatar" class="avatar" src="https://s4.anilist.co/file/anilistcdn/user/avatar/large/b6924046-dfZfSooyG2pO.jpg" alt="Avatar">
    <div class="user-info">
      <h3 class="username">alphaknight29</h3>
      <p class="sub">AniList Anime List</p>
    </div>
  </div>
  
  <div class="content" id="content">
    <div class="loading">Loading list...</div>
  </div>

  <script>
    const query = `
      query (\$userName: String) {
        MediaListCollection(userName: \$userName, type: ANIME) {
          lists {
            name
            isCustomList
            status
            entries {
              progress
              score(format: POINT_10)
              media {
                title {
                  english
                  romaji
                }
                coverImage {
                  large
                }
                episodes
              }
            }
          }
        }
      }
    `;

    fetch('https://graphql.anilist.co', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify({
        query: query,
        variables: { userName: 'alphaknight29' }
      })
    })
    .then(r => r.json())
    .then(data => {
      const collection = data.data.MediaListCollection;
      if (!collection || !collection.lists) {
        document.getElementById('content').innerHTML = '<div class="loading">Failed to load list.</div>';
        return;
      }
      
      let html = '';
      const order = ['CURRENT', 'COMPLETED', 'PAUSED', 'DROPPED', 'PLANNING'];
      const sortedLists = [...collection.lists].sort((a, b) => {
        return order.indexOf(a.status) - order.indexOf(b.status);
      });
      
      sortedLists.forEach(list => {
        if (!list.entries || list.entries.length === 0) return;
        
        let listName = list.name;
        if (list.status === 'CURRENT') listName = 'Watching';
        
        html += '<div class="list-container">';
        html += '  <div class="section-title">' + listName + ' (' + list.entries.length + ')</div>';
        
        list.entries.slice(0, 15).forEach(entry => {
          const title = entry.media.title.english || entry.media.title.romaji;
          const cover = entry.media.coverImage.large;
          const episodes = entry.media.episodes || '?';
          const progress = entry.progress || 0;
          const percent = episodes !== '?' ? (progress / episodes) * 100 : 0;
          const scoreText = entry.score ? '<span class="score">' + entry.score + '/10</span>' : '';
          
          html += '  <div class="anime-card">';
          html += '    <img class="cover-img" src="' + cover + '" alt="Cover">';
          html += '    <div class="anime-details">';
          html += '      <div class="anime-title">' + title + '</div>';
          html += '      <div class="progress-bar">';
          html += '        <div class="progress-fill" style="width: ' + percent + '%"></div>';
          html += '      </div>';
          html += '      <div class="progress-text">';
          html += '        <span>Ep ' + progress + ' / ' + episodes + '</span>';
          html += '        ' + scoreText;
          html += '      </div>';
          html += '    </div>';
          html += '  </div>';
        });
        
        if (list.entries.length > 15) {
          html += '  <div style="text-align:center;font-size:9px;color:#8596a5;padding:6px 0;">+ ' + (list.entries.length - 15) + ' more. Click button to view all.</div>';
        }
        
        html += '</div>';
      });
      
      document.getElementById('content').innerHTML = html;
    })
    .catch(err => {
      console.error(err);
      document.getElementById('content').innerHTML = '<div class="loading">Error loading list from AniList.</div>';
    });
  </script>
</body>
</html>
''';
    return "data:text/html;charset=utf-8,${Uri.encodeComponent(htmlContent)}";
  }

  Future<void> _launchAnilist() async {
    final url = Uri.parse(_anilistUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final double width = MediaQuery.sizeOf(context).width;
    final bool isDesktopLayout =
        width >= AppConstants.pinterestDesktopBreakpoint;
    final bool isMobileLayout = width < AppConstants.pinterestMobileBreakpoint;

    final bgColor = AppColors.getAnilistBg(context);
    final borderColor = AppColors.getAnilistBorder(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (!isMobileLayout) {
                final double mockupColumnWidth =
                    constraints.maxWidth * (isDesktopLayout ? 0.32 : 0.45);
                final double mockupWidth =
                    (mockupColumnWidth - AppConstants.spaceM).clamp(
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
          if (onClosePressed != null)
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                onPressed: onClosePressed,
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.1),
                  hoverColor: Colors.white.withValues(alpha: 0.2),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
        ],
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
    const double titleFontSizeTablet =
        AppConstants.pinterestTitleFontSizeTablet;
    const double titleFontSizeDesktop =
        AppConstants.pinterestTitleFontSizeDesktop;
    const double descFontSizeTablet = AppConstants.pinterestDescFontSizeTablet;
    const double descFontSizeDesktop =
        AppConstants.pinterestDescFontSizeDesktop;

    final double titleSize =
        screenWidth < AppConstants.pinterestResponsiveTitleBreakpoint
            ? titleFontSizeTablet
            : titleFontSizeDesktop;
    final double descSize =
        screenWidth < AppConstants.pinterestResponsiveTitleBreakpoint
            ? descFontSizeTablet
            : descFontSizeDesktop;

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
                    children: [
                      Text(
                        "Watch. Read. Repeat",
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      CornerHighlight(
                        corner: SparkleCorner.rightCenter,
                        color: AppColors.white,
                        lengthFactor: 0.8,
                        child: SizedBox(width: AppConstants.spaceS),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.spaceM),
                  Text(
                    "Keeping track of every anime and manga I've enjoyed. Explore my complete collection, favorites, and ongoing series on AniList.",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: descSize,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spaceL),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: AppConstants.spaceM,
                    children: [
                      CustomButton.filled(
                        color: AppColors.white,
                        textColor: AppColors.anilistBtnText,
                        label: "See My Collection",
                        prefixIcon: const Icon(
                          SimpleIcons.anilist,
                          size: AppConstants.pinterestIconSize,
                          color: AppColors.anilistBtnText,
                        ),
                        onPress: _launchAnilist,
                      ),
                    ],
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
                  // Desktop layout: character placed BELOW the phone mockup frame
                  final double totalWidth = constraints.maxWidth;
                  final double middleWidth = totalWidth * (32 / 62);
                  final double mockupLeft = (middleWidth - mockupWidth) / 2;

                  // Position the character so that the left edge of the image touches/overlaps the mockup slightly
                  final double characterLeft = mockupLeft + mockupWidth - 12.0;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Layer 1: Character (Behind mockup)
                      Positioned(
                        left: characterLeft,
                        bottom: -18,
                        height: 320,
                        child: const _AnilistHoverImage(),
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
          CornerStars(
            position: StarPosition.topRight,
            child: const Text(
              "My Anime Streak",
              style: TextStyle(
                fontSize: AppConstants.pinterestTitleFontSizeMobile,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: AppConstants.spaceM),
          Text(
            "Keeping track of my watch logs and favorite series. A scrollable view of my current lists directly fetched from the AniList API.",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: AppConstants.pinterestDescFontSizeMobile,
              height: 1.6,
            ),
          ),
          const SizedBox(height: AppConstants.techSectionPadding),
          Row(
            spacing: AppConstants.spaceM,
            children: [
              CustomButton.filled(
                color: AppColors.white,
                textColor: AppColors.anilistBtnText,
                label: "View on AniList",
                prefixIcon: const Icon(
                  Icons.open_in_new,
                  size: AppConstants.pinterestIconSize,
                  color: AppColors.anilistBtnText,
                ),
                onPress: _launchAnilist,
              ),
            ],
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
    // Custom mockup button colors for dark bg context
    final deviceBg = AppColors.getAnilistDeviceBg(context);
    final deviceColor = AppColors.getAnilistDeviceBorder(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Volume buttons
        Positioned(
          left: -5,
          top: 120,
          child: _sideButton(
            height: AppConstants.pinterestMockupButtonHeight,
            color: deviceColor,
          ),
        ),
        Positioned(
          left: -5,
          top: 170,
          child: _sideButton(
            height: AppConstants.pinterestMockupButtonHeight,
            color: deviceColor,
          ),
        ),

        // Power button
        Positioned(
          right: -5,
          top: 120,
          child: _sideButton(
            height: AppConstants.pinterestMockupButtonHeight,
            color: deviceColor,
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: deviceBg,
            borderRadius: BorderRadius.circular(
              AppConstants.pinterestMockupBorderRadius,
            ),
            border: Border.all(
              color: deviceColor,
              width: AppConstants.pinterestMockupBorderWidth,
            ),
            boxShadow: [
              if (MediaQuery.sizeOf(context).width >= AppConstants.pinterestMobileBreakpoint)
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
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
                viewId: "anilist-profile-view",
                url: _getAnilistDataUrl(),
                placeholder: _buildAnilistPlaceholder(context),
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

  Widget _buildAnilistPlaceholder(BuildContext context) {
    const primaryBlue = Color(0xFF3DB4F2);
    const darkBg = Color(0xFF0B1622);
    const cardBg = Color(0xFF152232);

    return Container(
      color: darkBg,
      child: Stack(
        children: [
          // Skeleton content representing AniList list
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Opacity(
                opacity: 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: cardBg,
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.4),
                              shape: BoxShape.circle,
                              border: Border.all(color: primaryBlue, width: 1.5),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: primaryBlue,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: 60,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withValues(alpha: 0.4),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Body cards
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          _anilistSkeletonCard(),
                          const SizedBox(height: 6),
                          _anilistSkeletonCard(),
                          const SizedBox(height: 6),
                          _anilistSkeletonCard(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Central prompt
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: primaryBlue.withValues(alpha: 0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
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
                      color: primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      SimpleIcons.anilist,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Anime Tracker",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Feed Loading",
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.white70,
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

  Widget _anilistSkeletonCard() {
    const cardBg = Color(0xFF152232);
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(1.5),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnilistHoverImage extends StatefulWidget {
  const _AnilistHoverImage();

  @override
  State<_AnilistHoverImage> createState() => _AnilistHoverImageState();
}

class _AnilistHoverImageState extends State<_AnilistHoverImage> {
  bool _isHovered = false;
  OverlayEntry? _overlayEntry;

  void _showTooltip() {
    _hideTooltip(); // Clear any existing overlay

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    const double tooltipWidth = 140.0;
    // Align horizontally with the top right of the character's hair/head (78% from left edge of image)
    final double targetX = position.dx + size.width * 0.78;

    final double leftPos = (targetX - tooltipWidth / 2).clamp(
      16.0,
      screenWidth - tooltipWidth - 16.0,
    );

    final double actualCenterOnTooltip = targetX - leftPos;
    final double tailXOffset = (actualCenterOnTooltip / tooltipWidth).clamp(
      0.15,
      0.85,
    );

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: leftPos,
              bottom: screenHeight - position.dy - 22,
              width: tooltipWidth,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  color: Colors.transparent,
                  child: PixelTooltipBubble(
                    message: "Kamehame..HAAA!",
                    showBelow: false,
                    tailXOffset: tailXOffset,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _showTooltip();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _hideTooltip();
      },
      child: Image.asset(
        _isHovered
            ? "assets/images/pinterest/anime_image_2.webp"
            : "assets/images/pinterest/anime_image_1.webp",
        cacheWidth: 800,
        fit: BoxFit.contain,
        alignment: Alignment.bottomRight,
        filterQuality: FilterQuality.high,
        gaplessPlayback: true,
      ),
    );
  }
}
