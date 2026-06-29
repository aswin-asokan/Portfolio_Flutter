import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:portfolio/features/shared/widgets/pixel_tooltip_bubble.dart';
import 'package:simple_icons/simple_icons.dart';

class TechItemData {
  final String name;
  final IconData icon;
  final Color color;
  final String? tooltip;

  const TechItemData({
    required this.name,
    required this.icon,
    required this.color,
    this.tooltip,
  });
}

class TechIUse extends StatefulWidget {
  const TechIUse({super.key});

  @override
  State<TechIUse> createState() => _TechIUseState();
}

class _TechIUseState extends State<TechIUse> {
  bool _isExpanded = false;

  static const List<TechItemData> techItems = [
    TechItemData(
      name: "Flutter",
      icon: SimpleIcons.flutter,
      color: AppColors.brandFlutter,
      tooltip: "My comfort zone. Most of my ideas end up here.",
    ),
    TechItemData(
      name: "Dart",
      icon: SimpleIcons.dart,
      color: AppColors.brandDart,
      tooltip: "Fluent enough that semicolons now feel optional elsewhere.",
    ),
    TechItemData(
      name: "C++",
      icon: SimpleIcons.cplusplus,
      color: AppColors.brandCpp,
      tooltip:
          "Learnt where pointers were scary and segfaults were life lessons.",
    ),
    TechItemData(
      name: "C",
      icon: SimpleIcons.c,
      color: AppColors.brandC,
      tooltip: "Still remember malloc. Still double-check free.",
    ),
    TechItemData(
      name: "HTML",
      icon: SimpleIcons.html5,
      color: AppColors.brandHtml,
      tooltip: "My brief attempt at becoming a web developer.",
    ),
    TechItemData(
      name: "CSS",
      icon: SimpleIcons.css,
      color: AppColors.brandCss,
      tooltip: "Spent more time centering divs than I'd like to admit.",
    ),
    TechItemData(
      name: "JavaScript",
      icon: SimpleIcons.javascript,
      color: AppColors.brandJavascript,
      tooltip: "We almost became best friends. Flutter had other plans.",
    ),
    TechItemData(
      name: "React",
      icon: SimpleIcons.react,
      color: AppColors.brandReact,
      tooltip: "Tried switching. Flutter politely refused to let me leave.",
    ),
    TechItemData(
      name: "Python",
      icon: SimpleIcons.python,
      color: AppColors.brandPython,
      tooltip: "The language that convinced me RAM and GPU is never enough.",
    ),
    TechItemData(
      name: "MySQL",
      icon: SimpleIcons.mysql,
      color: AppColors.brandMysql,
      tooltip: "Mostly retired, occasionally called back to work.",
    ),
    TechItemData(
      name: "Firebase",
      icon: SimpleIcons.firebase,
      color: AppColors.brandFirebase,
      tooltip: "The \"I need a backend today\" button.",
    ),
    TechItemData(
      name: "GCP",
      icon: SimpleIcons.googlecloud,
      color: AppColors.brandGcp,
      tooltip: "Mostly visit for APIs and then quietly leave.",
    ),
    TechItemData(
      name: "Arduino",
      icon: SimpleIcons.arduino,
      color: AppColors.brandArduino,
      tooltip: "Enough to make LEDs blink and ESP32s behave... mostly.",
    ),
    TechItemData(
      name: "GitHub",
      icon: SimpleIcons.github,
      color: AppColors.brandGithub,
      tooltip: "Where bugs become commit history.",
    ),
    TechItemData(
      name: "Git",
      icon: SimpleIcons.git,
      color: AppColors.brandGit,
      tooltip: "git add . → git commit → hope for the best.",
    ),
    TechItemData(
      name: "Bitbucket",
      icon: SimpleIcons.bitbucket,
      color: AppColors.brandBitbucket,
      tooltip: "Corporate GitHub. Still gets the job done.",
    ),
    TechItemData(
      name: "DBeaver",
      icon: SimpleIcons.dbeaver,
      color: AppColors.brandDbeaver,
      tooltip: "Because looking directly at the database feels reassuring.",
    ),
    TechItemData(
      name: "Figma",
      icon: SimpleIcons.figma,
      color: AppColors.figma,
      tooltip: "Mostly here to inspect, not invent.",
    ),
    TechItemData(
      name: "VS Code",
      icon: SimpleIcons.vscodium,
      color: AppColors.brandVsCode,
      tooltip: "Opened once. Closed... eventually.",
    ),
    TechItemData(
      name: "Android Studio",
      icon: SimpleIcons.androidstudio,
      color: AppColors.brandAndroidStudio,
      tooltip: "Mostly opened for the emulator. Occasionally survives longer.",
    ),
    TechItemData(
      name: "XCode",
      icon: SimpleIcons.xcode,
      color: AppColors.brandXcode,
      tooltip: "Opened only when Apple insists.",
    ),
    TechItemData(
      name: "Antigravity",
      icon: SimpleIcons.googlegemini,
      color: AppColors.brandAntigravity,
      tooltip: "Helps turn half-baked ideas into actual features.",
    ),
    TechItemData(
      name: "Codex",
      icon: SimpleIcons.openaigym,
      color: AppColors.brandCodex,
      tooltip: "Makes me look smarter than I probably am.",
    ),
    TechItemData(
      name: "Confluence",
      icon: SimpleIcons.confluence,
      color: AppColors.brandConfluence,
      tooltip: "Where documentation goes to become surprisingly useful.",
    ),
    TechItemData(
      name: "Jira",
      icon: SimpleIcons.jira,
      color: AppColors.brandJira,
      tooltip: "Turning \"I'll do it later\" into actual tickets.",
    ),
    TechItemData(
      name: "Pop OS",
      icon: SimpleIcons.popos,
      color: AppColors.brandPopOs,
      tooltip: "The OS that just lets me build things.",
    ),
    TechItemData(
      name: "MacOS",
      icon: SimpleIcons.apple,
      color: AppColors.brandMacOs,
      tooltip: "Work mode: enabled.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.techSectionPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double width = constraints.maxWidth;
                final bool isSmallScreen =
                    width < AppConstants.techMobileTitleBreakpoint;

                if (isSmallScreen) {
                  return _buildMobileLayout(width);
                } else {
                  return _buildDesktopLayout(width);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(double totalWidth) {
    // Title takes techDesktopTitleWidth, spacing takes techDesktopTitleSpacing
    final double rem =
        totalWidth -
        AppConstants.techDesktopTitleWidth -
        AppConstants.techDesktopTitleSpacing;

    const double minSpacing = AppConstants.spaceS;
    final int maxItems =
        ((rem - AppConstants.techItemSize) /
                (AppConstants.techItemSize + minSpacing))
            .floor();
    final int totalItems = maxItems + 1;
    final double dynamicItemSize =
        ((rem - (totalItems - 1) * AppConstants.techSpacing) / totalItems) -
        0.1;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: AppConstants.techDesktopTitleTopPadding,
          ),
          child: SizedBox(
            width: AppConstants.techDesktopTitleWidth,
            child: _buildDesktopTitle(),
          ),
        ),
        const SizedBox(width: AppConstants.techDesktopTitleSpacing),
        Expanded(
          child: Wrap(
            spacing: AppConstants.techSpacing,
            runSpacing: AppConstants.techSpacing,
            children: [
              if (_isExpanded)
                ...techItems.map(
                  (item) => TechItemCard(
                    name: item.name,
                    icon: item.icon,
                    brandColor: item.color,
                    size: dynamicItemSize,
                    tooltip: item.tooltip,
                  ),
                )
              else
                ...techItems
                    .take(maxItems)
                    .map(
                      (item) => TechItemCard(
                        name: item.name,
                        icon: item.icon,
                        brandColor: item.color,
                        size: dynamicItemSize,
                        tooltip: item.tooltip,
                      ),
                    ),
              ToggleExpandCard(
                isExpandButton: !_isExpanded,
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                size: dynamicItemSize,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(double totalWidth) {
    // Title is above items, so we have full width inside card (totalWidth)
    const double minSpacing = AppConstants.spaceS;
    final int maxItems =
        ((totalWidth - AppConstants.techItemSize) /
                (AppConstants.techItemSize + minSpacing))
            .floor();
    final int totalItems = maxItems + 1;
    final double dynamicItemSize =
        ((totalWidth - (totalItems - 1) * AppConstants.techSpacing) /
            totalItems) -
        0.1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildMobileTitle(),
        const SizedBox(height: AppConstants.techMobileTitleSpacing),
        Wrap(
          spacing: AppConstants.techSpacing,
          runSpacing: AppConstants.techSpacing,
          children: [
            if (_isExpanded)
              ...techItems.map(
                (item) => TechItemCard(
                  name: item.name,
                  icon: item.icon,
                  brandColor: item.color,
                  size: dynamicItemSize,
                  tooltip: item.tooltip,
                ),
              )
            else
              ...techItems
                  .take(maxItems)
                  .map(
                    (item) => TechItemCard(
                      name: item.name,
                      icon: item.icon,
                      brandColor: item.color,
                      size: dynamicItemSize,
                      tooltip: item.tooltip,
                    ),
                  ),
            ToggleExpandCard(
              isExpandButton: !_isExpanded,
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              size: dynamicItemSize,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopTitle() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.white : AppColors.black;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Tech",
              style:
                  context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: AppConstants.techTitleFontSizeDesktop,
                  ) ??
                  TextStyle(
                    fontSize: AppConstants.techTitleFontSizeDesktop,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
            ),
            const SizedBox(width: AppConstants.spaceXS),
            Text(
              "I",
              style:
                  context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.sparklePurple,
                    fontSize: AppConstants.techTitleFontSizeDesktop,
                  ) ??
                  const TextStyle(
                    fontSize: AppConstants.techTitleFontSizeDesktop,
                    fontWeight: FontWeight.bold,
                    color: AppColors.sparklePurple,
                  ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spaceXS),
        CornerHighlight(
          corner: SparkleCorner.rightCenter,
          color: AppColors.sparklePink.withValues(alpha: 0.6),
          lengthFactor: 0.6,
          strokeWidth: AppConstants.techTitleStrokeWidth,
          extraSpread: 0.1,
          child: Padding(
            padding: const EdgeInsets.only(right: 6, bottom: 2),
            child: Text(
              "Use",
              style:
                  context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: AppConstants.techTitleFontSizeDesktop,
                  ) ??
                  TextStyle(
                    fontSize: AppConstants.techTitleFontSizeDesktop,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTitle() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.white : AppColors.black;

    return CornerHighlight(
      corner: SparkleCorner.rightCenter,
      color: AppColors.sparklePink.withValues(alpha: 0.6),
      lengthFactor: 0.6,
      strokeWidth: AppConstants.techTitleStrokeWidth,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Tech I Use",
            style:
                context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontSize: AppConstants.techTitleFontSizeMobile,
                ) ??
                TextStyle(
                  fontSize: AppConstants.techTitleFontSizeMobile,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
          ),
          const SizedBox(width: AppConstants.spaceS),
        ],
      ),
    );
  }
}

class TechItemCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color brandColor;
  final double size;
  final String? tooltip;

  const TechItemCard({
    super.key,
    required this.name,
    required this.icon,
    required this.brandColor,
    this.size = AppConstants.techItemSize,
    this.tooltip,
  });

  @override
  State<TechItemCard> createState() => _TechItemCardState();
}

class _TechItemCardState extends State<TechItemCard> {
  bool _isHovered = false;
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  void _showTooltip() {
    _hideTooltip(); // clear existing if any

    final String? msg = widget.tooltip;
    if (msg == null || msg.isEmpty) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    // Determine if we show it below or above
    final bool showBelow = position.dy < AppConstants.techTooltipOffsetLimit;

    // Boundary check and horizontal shift calculation to keep bubble fully on screen
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final globalCenterX = position.dx + size.width / 2;

    double shiftX = 0.0;
    if (globalCenterX - AppConstants.techTooltipHorizontalLimit <
        AppConstants.spaceS) {
      shiftX =
          AppConstants.spaceS -
          (globalCenterX - AppConstants.techTooltipHorizontalLimit);
    } else if (globalCenterX + AppConstants.techTooltipHorizontalLimit >
        screenWidth - AppConstants.spaceS) {
      shiftX =
          (screenWidth - AppConstants.spaceS) -
          (globalCenterX + AppConstants.techTooltipHorizontalLimit);
    }

    // Relative fraction of the tail location on the bubble width (techTooltipWidth)
    final double tailXOffset =
        (AppConstants.techTooltipHorizontalLimit - shiftX) /
        AppConstants.techTooltipWidth;
    final double leftPos =
        position.dx - (AppConstants.techTooltipWidth - size.width) / 2 + shiftX;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: leftPos,
              top: showBelow ? position.dy + size.height + 6.0 : null,
              bottom: showBelow ? null : screenHeight - position.dy + 6.0,
              width: AppConstants.techTooltipWidth,
              child: Align(
                alignment:
                    showBelow ? Alignment.topCenter : Alignment.bottomCenter,
                child: Material(
                  color: Colors.transparent,
                  child: PixelTooltipBubble(
                    message: msg,
                    showBelow: showBelow,
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
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseBg = AppColors.getTechCardBg(context);

    final resolvedColor =
        (widget.name == "Next.js" || widget.name == "GitHub")
            ? (isDark ? AppColors.white : AppColors.black)
            : widget.brandColor;

    final borderSide =
        _isHovered
            ? BorderSide(
              color: resolvedColor.withAlpha((0.8 * 255).round()),
              width: AppConstants.techCardBorderWidthHovered,
            )
            : BorderSide(
              color: AppColors.getBorder(context),
              width: AppConstants.techCardBorderWidthDefault,
            );

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _showTooltip();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _hideTooltip();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: baseBg,
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
          border: Border.fromBorderSide(borderSide),
          boxShadow:
              _isHovered
                  ? [
                    BoxShadow(
                      color: resolvedColor.withAlpha((0.25 * 255).round()),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ]
                  : [],
        ),
        transform:
            _isHovered
                ? Matrix4.translationValues(
                  0,
                  AppConstants.techCardHoverTranslateY,
                  0,
                )
                : Matrix4.identity(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: resolvedColor,
              size: AppConstants.techIconSize,
            ),
            const SizedBox(height: 6),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: AppConstants.techItemFontSize,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleExpandCard extends StatefulWidget {
  final bool isExpandButton;
  final VoidCallback onTap;
  final double size;

  const ToggleExpandCard({
    super.key,
    required this.isExpandButton,
    required this.onTap,
    this.size = AppConstants.techItemSize,
  });

  @override
  State<ToggleExpandCard> createState() => _ToggleExpandCardState();
}

class _ToggleExpandCardState extends State<ToggleExpandCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseBg = AppColors.getTechCardBg(context);
    final accentColor = Theme.of(context).colorScheme.primary;

    final borderSide =
        _isHovered
            ? BorderSide(
              color: accentColor.withAlpha((0.8 * 255).round()),
              width: AppConstants.techCardBorderWidthHovered,
            )
            : BorderSide(
              color: AppColors.getBorder(context),
              width: AppConstants.techCardBorderWidthDefault,
            );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: baseBg,
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            border: Border.fromBorderSide(borderSide),
            boxShadow:
                _isHovered
                    ? [
                      BoxShadow(
                        color: accentColor.withAlpha((0.25 * 255).round()),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ]
                    : [],
          ),
          transform:
              _isHovered
                  ? Matrix4.translationValues(
                    0,
                    AppConstants.techCardHoverTranslateY,
                    0,
                  )
                  : Matrix4.identity(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.isExpandButton ? Icons.more_horiz : Icons.expand_less,
                color:
                    isDark
                        ? AppColors.white.withValues(alpha: 0.6)
                        : AppColors.black.withValues(alpha: 0.54),
                size: AppConstants.techIconSize,
              ),
              const SizedBox(height: 6),
              Text(
                widget.isExpandButton ? "More" : "Less",
                style: const TextStyle(
                  fontSize: AppConstants.techItemFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
