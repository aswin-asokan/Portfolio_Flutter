import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class Experience extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final ValueChanged<double>? onHeightMeasured;
  final double? forcedWidth;

  const Experience({
    super.key,
    required this.isExpanded,
    required this.onToggleExpand,
    this.onHeightMeasured,
    this.forcedWidth,
  });

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final List<Map<String, dynamic>> experiences = [
    {
      "icon": Symbols.school,
      "role": "Bootcamp Instructor",
      "org": "ISTE MACE Chapter",
      "period": "Apr 2025 - Present",
      "summary": [
        "Guided 30+ students in a Flutter app development bootcamp.",
        "Covered multi-page app functionality",
        "Provided training on integrating apps with an online database.",
        "Created and shared structured documentation",
      ],
      "url": "https://aswin-asokan.github.io/iste_bootcamp/",
      "hasLink": true,
    },
    {
      "icon": Symbols.school,
      "role": "Bootcamp Instructor",
      "org": "ISTE MACE Chapter",
      "period": "Apr 2025 - Present",
      "summary": [
        "Guided 30+ students in a Flutter app development bootcamp.",
        "Covered multi-page app functionality",
        "Provided training on integrating apps with an online database.",
        "Created and shared structured documentation",
      ],
      "url": "https://aswin-asokan.github.io/iste_bootcamp/",
      "hasLink": true,
    },
    {
      "icon": Symbols.computer,
      "role": "Flutter Developer",
      'org': "Flysoft Systems | Intern",
      "period": "Oct 2024 - Dec 2024",
      "summary": [
        "Contributed to the development of a Flutter application for restaurants.",
        "Enabled users to create customized multi-floor plans.",
        "Integrated features to arrange tables and optimize layouts with intuitive controls.",
        "Implemented interactive design tools for a better user experience.",
      ],
      "hasFile": true,
      "file": "https://aswinasokan.vercel.app/assets/assets/files/flysoft.pdf",
      "filename": "Flysoft_internship_report.pdf",
    },
    {
      "icon": Symbols.lightbulb_outline,
      "role": "Technology Lead",
      'org': "IEDC Kalamassery",
      'period': "Aug 2021 - Mar 2023",
      "summary": [
        "Actively organized and coordinated Yanthrika 2K22 Idea Fest.",
        "Managed the evaluation of 25+ innovative project ideas.",
        "Organized a 3D printing workshop with 50+ participants.",
        "Conducted an IoT workshop, engaging 30+ students in hands-on learning.",
      ],
    },
    {
      "icon": Symbols.android,
      "role": "Flutter Developer",
      "org": "Laxmiinfotek | Intern",
      "period": "Sep 2022",
      "summary": [
        "Successfully completed an internship program.",
        "Developed a To-Do application using Flutter.",
        "Applied core concepts of UI design and state management.",
        "Implemented firebase connection",
      ],
      "hasFile": true,
      "file":
          "https://aswinasokan.vercel.app/assets/assets/files/laxmiinfotek.jpeg",
      "filename": "Laxmiinfotek_internship_certificate.jpeg",
    },
  ];

  final List<Color> accentColors = [
    const Color(0xFF66BB6A), // green
    const Color(0xFFFFB74D), // orange
    const Color(0xFFF48FB1), // pink
    const Color(0xFF4FC3F7), // blue
  ];

  final List<String> illustrations = [
    "assets/images/about/focus.webp",
    "assets/images/about/hobbies.webp",
    "assets/images/about/personality.webp",
    "assets/images/about/fuel.webp",
  ];

  void downloadAssetFile(String assetPath, String downloadFileName) async {
    final url = Uri.parse(assetPath);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _launch(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $urlString');
    }
  }

  Widget _buildTimelineItem(
    BuildContext context,
    Map<String, dynamic> exp,
    int index,
    bool isLast,
  ) {
    final Color dotColor = accentColors[index % accentColors.length];
    final String illustrationPath = illustrations[index % illustrations.length];

    final String role = exp["role"] as String;
    final String org = exp["org"] as String;
    final String period = exp["period"] as String;
    final List<String> summary = exp["summary"] as List<String>;
    final String summaryText = summary
        .map((s) => s.endsWith('.') ? s : '$s.')
        .join(" ");

    final String? url = exp["url"] as String?;
    final bool hasLink = exp["hasLink"] as bool? ?? false;
    final String? file = exp["file"] as String?;
    final bool hasFile = exp["hasFile"] as bool? ?? false;
    final String? filename = exp["filename"] as String?;

    final double illSize = Responsive.isMobile(context) ? 60 : 75;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left timeline (dot & vertical line)
          SizedBox(
            width: 16,
            child: Column(
              children: [
                // Ring/Dot
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    border: Border.all(color: dotColor, width: 3.5),
                  ),
                ),
                // Vertical Line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2.5,
                      color: dotColor.withValues(alpha: 0.35),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Content & Illustration
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          period,
                          style: context.textTheme.displaySmall?.copyWith(
                            color: dotColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          role,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                org,
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: AppColors.getSubtitleText(context),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (hasLink || hasFile) ...[
                              const SizedBox(width: 6),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    hasLink
                                        ? _launch(url!)
                                        : downloadAssetFile(file!, filename!);
                                  },
                                  child: Icon(
                                    Symbols.insert_link,
                                    color: context.colorScheme.primary,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          summaryText,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.getDescriptionText(context),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Cartoon Illustration
                  Image.asset(
                    illustrationPath,
                    width: illSize,
                    height: illSize,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedDesktopTimeline(
    BuildContext context,
    List<Map<String, dynamic>> displayedExperiences,
  ) {
    final int N = displayedExperiences.length;
    final int leftCount = (N + 1) ~/ 2;
    final List<Map<String, dynamic>> leftExps = displayedExperiences.sublist(
      0,
      leftCount,
    );
    final List<Map<String, dynamic>> rightExps = displayedExperiences.sublist(
      leftCount,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < leftExps.length; i++)
                _buildTimelineItem(
                  context,
                  leftExps[i],
                  i,
                  i == leftExps.length - 1,
                ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < rightExps.length; i++)
                _buildTimelineItem(
                  context,
                  rightExps[i],
                  leftCount + i,
                  i == rightExps.length - 1,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSingleColumnTimeline(
    BuildContext context,
    List<Map<String, dynamic>> displayedExperiences,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < displayedExperiences.length; i++)
          _buildTimelineItem(
            context,
            displayedExperiences[i],
            i,
            i == displayedExperiences.length - 1,
          ),
      ],
    );
  }

  final GlobalKey _contentKey = GlobalKey();
  double? _lastReportedHeight;
  double? _lastMeasuredWidth;
  Timer? _heightDebounceTimer;

  @override
  void dispose() {
    _heightDebounceTimer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Experience oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      _lastReportedHeight = null;
      _lastMeasuredWidth = null;
    }
  }

  void _checkHeight() {
    if (!mounted || !widget.isExpanded) return;
    final RenderBox? renderBox = _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final double currentWidth = renderBox.size.width;
      final double height = renderBox.size.height + 48.0 + 3.0; // Column height + vertical padding (24*2) + border width

      // If the width is still changing (parent AnimatedPositioned animating),
      // keep re-measuring so we capture the correct height at final width.
      // Use addPostFrameCallback only (no scheduleFrame) to piggyback on
      // frames that the animation system already requests.
      if (_lastMeasuredWidth == null || (currentWidth - _lastMeasuredWidth!).abs() > 0.5) {
        _lastMeasuredWidth = currentWidth;
        WidgetsBinding.instance.addPostFrameCallback((_) => _checkHeight());
      }

      // Debounce the height report so we don't trigger parent setState on
      // every single frame during the cross-fade / position animation.
      if (height != _lastReportedHeight) {
        _heightDebounceTimer?.cancel();
        _heightDebounceTimer = Timer(const Duration(milliseconds: 50), () {
          if (mounted && height != _lastReportedHeight) {
            _lastReportedHeight = height;
            widget.onHeightMeasured?.call(height);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isDesktopLayout = width >= 1024;
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkHeight());

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: context.colorScheme.surface,
        border: Border.all(color: AppColors.getBorder(context), width: 1.5),
      ),
      clipBehavior: Clip.antiAlias, // Cleanly clip rounded corners and prevent bottom bleed
      child: isDesktopLayout
          ? AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
              sizeCurve: Curves.easeInOut,
              crossFadeState: widget.isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Experience",
                                  style: context.textTheme.labelLarge!.copyWith(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Transform.translate(
                                  offset: const Offset(-8, -8),
                                  child: Transform.rotate(
                                    angle: 0.3,
                                    child: Icon(
                                      Symbols.insights,
                                      color: AppColors.sparklePurple,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: widget.onToggleExpand,
                                child: Text(
                                  "View All →",
                                  style: context.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.getSubtitleText(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Collapsed content Stack
                        SizedBox(
                          height: 381.0, // 490 - 48 (vertical padding) - 34 (header) - 24 (spacing) - 3 (border) = 381
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: ScrollConfiguration(
                                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                                  child: SingleChildScrollView(
                                    physics: const NeverScrollableScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < experiences.length; i++)
                                          _buildTimelineItem(context, experiences[i], i, i == experiences.length - 1),
                                        const SizedBox(height: 24),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Foggy Overlay at bottom
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                height: 100,
                                child: IgnorePointer(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          context.colorScheme.surface.withValues(alpha: 0.0),
                                          context.colorScheme.surface.withValues(alpha: 0.85),
                                          context.colorScheme.surface,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              secondChild: SizedBox(
                width: widget.forcedWidth,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        key: _contentKey,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Experience",
                                    style: context.textTheme.labelLarge!.copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: context.colorScheme.onSurface,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Transform.translate(
                                    offset: const Offset(-8, -8),
                                    child: Transform.rotate(
                                      angle: 0.3,
                                      child: Icon(
                                        Symbols.insights,
                                        color: AppColors.sparklePurple,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: widget.onToggleExpand,
                                  child: Text(
                                    "view less ←",
                                    style: context.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.getSubtitleText(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildExpandedDesktopTimeline(context, experiences),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Experience",
                            style: context.textTheme.labelLarge!.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Transform.translate(
                            offset: const Offset(-8, -8),
                            child: Transform.rotate(
                              angle: 0.3,
                              child: Icon(
                                Symbols.insights,
                                color: AppColors.sparklePurple,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: widget.onToggleExpand,
                          child: Text(
                            widget.isExpanded ? "view less ←" : "View All →",
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.getSubtitleText(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 500),
                    firstCurve: Curves.easeInOut,
                    secondCurve: Curves.easeInOut,
                    sizeCurve: Curves.easeInOut,
                    crossFadeState: widget.isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    firstChild: _buildSingleColumnTimeline(context, experiences.take(2).toList()),
                    secondChild: _buildSingleColumnTimeline(context, experiences),
                  ),
                ],
              ),
            ),
    );
  }
}
