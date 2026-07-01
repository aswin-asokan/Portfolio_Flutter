import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:portfolio/features/shared/widgets/corner_star.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:portfolio/features/shared/widgets/pixel_tooltip_bubble.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AnilistEntry {
  final String title;
  final String coverImage;
  final int progress;
  final int totalEpisodes;
  final double? score;

  AnilistEntry({
    required this.title,
    required this.coverImage,
    required this.progress,
    required this.totalEpisodes,
    this.score,
  });

  factory AnilistEntry.fromJson(Map<String, dynamic> json) {
    final media = json['media'] ?? {};
    final titleObj = media['title'] ?? {};
    final title = titleObj['english'] ?? titleObj['romaji'] ?? 'Unknown Anime';
    final coverImage = media['coverImage']?['large'] ?? '';
    final progress = json['progress'] ?? 0;
    final totalEpisodes = media['episodes'] ?? 0;
    final scoreValue = json['score'] != null ? (json['score'] as num).toDouble() : null;

    return AnilistEntry(
      title: title,
      coverImage: coverImage,
      progress: progress,
      totalEpisodes: totalEpisodes,
      score: scoreValue,
    );
  }
}

class AnilistList {
  final String name;
  final String status;
  final List<AnilistEntry> entries;

  AnilistList({
    required this.name,
    required this.status,
    required this.entries,
  });

  factory AnilistList.fromJson(Map<String, dynamic> json) {
    final entriesJson = json['entries'] as List? ?? [];
    final entries = entriesJson.map((e) => AnilistEntry.fromJson(e)).toList();
    return AnilistList(
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      entries: entries,
    );
  }
}

class AnilistSection extends StatefulWidget {
  final VoidCallback? onClosePressed;
  const AnilistSection({super.key, this.onClosePressed});

  @override
  State<AnilistSection> createState() => _AnilistSectionState();
}

class _AnilistSectionState extends State<AnilistSection> {
  final String _anilistUrl = "https://anilist.co/user/alphaknight29/animelist";
  final Dio _dio = Dio();
  List<AnilistList> _lists = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchAnilistData();
  }

  Future<void> _fetchAnilistData() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      const query = r'''
        query ($userName: String) {
          MediaListCollection(userName: $userName, type: ANIME) {
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
      ''';

      final response = await _dio.post(
        'https://graphql.anilist.co',
        data: {
          'query': query,
          'variables': {'userName': 'alphaknight29'},
        },
      );

      if (response.statusCode == 200) {
        final collection = response.data['data']['MediaListCollection'];
        final List<dynamic> listsJson = collection['lists'] ?? [];
        final parsedLists = listsJson.map((l) => AnilistList.fromJson(l)).toList();

        // Sort lists according to priority order
        final order = ['CURRENT', 'COMPLETED', 'PAUSED', 'DROPPED', 'PLANNING'];
        parsedLists.sort((a, b) {
          final aIdx = order.indexOf(a.status);
          final bIdx = order.indexOf(b.status);
          final aVal = aIdx == -1 ? 99 : aIdx;
          final bVal = bIdx == -1 ? 99 : bIdx;
          return aVal.compareTo(bVal);
        });

        if (mounted) {
          setState(() {
            _lists = parsedLists;
            _isLoading = false;
          });
        }
      } else {
        throw Exception('Failed to load AniList data');
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
        });
      }
    }
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
          if (widget.onClosePressed != null)
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                onPressed: widget.onClosePressed,
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
              child: Stack(
                children: [
                  Positioned.fill(
                    child: _isLoading
                        ? _buildAnilistPlaceholder(context)
                        : _errorMessage != null
                            ? _buildErrorWidget(context, isDark, _errorMessage!, _fetchAnilistData)
                            : _buildAnilistFeed(context),
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
                            deviceBg.withValues(alpha: 0.0),
                            deviceBg.withValues(alpha: 0.85),
                            deviceBg,
                          ],
                          stops: const [0.0, 0.35, 1.0],
                        ),
                      ),
                      padding: const EdgeInsets.only(
                        top: AppConstants.spaceM,
                        bottom: AppConstants.spaceS + 20.0,
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: _launchAnilist,
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
                                const Text(
                                  "Visit Profile, View All",
                                  style: TextStyle(
                                    color: Color(0xFF3DB4F2),
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppConstants.fontS,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                const SizedBox(width: AppConstants.spaceXS),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF3DB4F2),
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

  Widget _buildAnilistFeed(BuildContext context) {
    const darkBg = Color(0xFF0B1622);
    const cardBg = Color(0xFF152232);
    const primaryBlue = Color(0xFF3DB4F2);

    final watchingLists = _lists.where((l) => l.status == 'CURRENT').toList();
    if (watchingLists.isEmpty) {
      return Container(
        color: darkBg,
        child: const Center(
          child: Text(
            "No active watching list found",
            style: TextStyle(color: Color(0xFF8596A5), fontSize: 10),
          ),
        ),
      );
    }

    final list = watchingLists.first;

    return Container(
      color: darkBg,
      child: Column(
        children: [
          // Header (Avatar + Username + Subtitle)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: cardBg,
              border: Border(
                bottom: BorderSide(color: Colors.white10, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: "https://s4.anilist.co/file/anilistcdn/user/avatar/large/b6924046-dfZfSooyG2pO.jpg",
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "alphaknight29",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "AniList Anime List",
                        style: TextStyle(
                          fontSize: 9,
                          color: Color(0xFF8596A5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // List content
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 80), // Padding-bottom to prevent cover by bottom overlays
              itemCount: 1,
              itemBuilder: (context, index) {
                if (list.entries.isEmpty) return const SizedBox();
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Title
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0, top: 4.0),
                      child: Row(
                        children: [
                          Container(
                            width: 2.5,
                            height: 12,
                            color: primaryBlue,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Watching (${list.entries.length})",
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8596A5),
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // List items (up to 15 entries)
                    ...list.entries.take(15).map((entry) => _buildAnimeCard(entry)),
                    
                    // "+ X more" message
                    if (list.entries.length > 15)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Center(
                          child: Text(
                            "+ ${list.entries.length - 15} more. Click button to view all.",
                            style: const TextStyle(
                              fontSize: 9,
                              color: Color(0xFF8596A5),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimeCard(AnilistEntry entry) {
    const cardBg = Color(0xFF152232);
    const primaryBlue = Color(0xFF3DB4F2);
    
    final episodes = entry.totalEpisodes > 0 ? entry.totalEpisodes.toString() : '?';
    final progress = entry.progress;
    final double percent = entry.totalEpisodes > 0 ? (progress / entry.totalEpisodes) : 0.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 6.0),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: CachedNetworkImage(
              imageUrl: entry.coverImage,
              width: 30,
              height: 42,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: const Color(0xFF0B1622)),
              errorWidget: (context, url, error) => Container(
                color: const Color(0xFF0B1622),
                child: const Icon(Icons.broken_image, size: 12, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFF0F3F6),
                  ),
                ),
                const SizedBox(height: 5),
                // Progress bar
                Container(
                  height: 3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(1.5),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percent.clamp(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ep $progress / $episodes",
                      style: const TextStyle(
                        fontSize: 8,
                        color: Color(0xFF8596A5),
                      ),
                    ),
                    if (entry.score != null && entry.score! > 0)
                      Text(
                        "${entry.score!.toStringAsFixed(0)}/10",
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF10B981),
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

  Widget _buildErrorWidget(
    BuildContext context,
    bool isDark,
    String message,
    VoidCallback onRetry,
  ) {
    const primaryBlue = Color(0xFF3DB4F2);
    return Container(
      color: const Color(0xFF0B1622),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.redAccent,
              size: 28,
            ),
            const SizedBox(height: 10),
            const Text(
              "Failed to load anime list",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("Retry", style: TextStyle(fontSize: 8.5, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
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
