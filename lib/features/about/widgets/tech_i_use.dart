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
      color: Color(0xFF02569B),
      tooltip: "My comfort zone. Most of my ideas end up here.",
    ),
    TechItemData(
      name: "Dart",
      icon: SimpleIcons.dart,
      color: Color(0xFF0175C2),
      tooltip: "Fluent enough that semicolons now feel optional elsewhere.",
    ),
    TechItemData(
      name: "C++",
      icon: SimpleIcons.cplusplus,
      color: Color(0xFF00599C),
      tooltip:
          "Learnt where pointers were scary and segfaults were life lessons.",
    ),
    TechItemData(
      name: "C",
      icon: SimpleIcons.c,
      color: Color(0xFFA8B9CC),
      tooltip: "Still remember malloc. Still double-check free.",
    ),
    TechItemData(
      name: "HTML",
      icon: SimpleIcons.html5,
      color: Color(0xFFE34F26),
      tooltip: "My brief attempt at becoming a web developer.",
    ),
    TechItemData(
      name: "CSS",
      icon: SimpleIcons.css,
      color: Color(0xFF1572B6),
      tooltip: "Spent more time centering divs than I'd like to admit.",
    ),
    TechItemData(
      name: "JavaScript",
      icon: SimpleIcons.javascript,
      color: Color(0xFFF7DF1E),
      tooltip: "We almost became best friends. Flutter had other plans.",
    ),
    TechItemData(
      name: "React",
      icon: SimpleIcons.react,
      color: Color(0xFF61DAFB),
      tooltip: "Tried switching. Flutter politely refused to let me leave.",
    ),
    TechItemData(
      name: "Python",
      icon: SimpleIcons.python,
      color: Color(0xFF3776AB),
      tooltip: "The language that convinced me RAM and GPU is never enough.",
    ),
    TechItemData(
      name: "MySQL",
      icon: SimpleIcons.mysql,
      color: Color(0xFF4479A1),
      tooltip: "Mostly retired, occasionally called back to work.",
    ),
    TechItemData(
      name: "Firebase",
      icon: SimpleIcons.firebase,
      color: Color(0xFFFFCA28),
      tooltip: "The \"I need a backend today\" button.",
    ),
    TechItemData(
      name: "GCP",
      icon: SimpleIcons.googlecloud,
      color: Color(0xFF4285F4),
      tooltip: "Mostly visit for APIs and then quietly leave.",
    ),
    TechItemData(
      name: "Arduino",
      icon: SimpleIcons.arduino,
      color: Color(0xFF00979D),
      tooltip: "Enough to make LEDs blink and ESP32s behave... mostly.",
    ),
    TechItemData(
      name: "GitHub",
      icon: SimpleIcons.github,
      color: Color(0xFF181717),
      tooltip: "Where bugs become commit history.",
    ),
    TechItemData(
      name: "Git",
      icon: SimpleIcons.git,
      color: Color(0xFFF05032),
      tooltip: "git add . → git commit → hope for the best.",
    ),
    TechItemData(
      name: "Bitbucket",
      icon: SimpleIcons.bitbucket,
      color: Color(0xFF0052CC),
      tooltip: "Corporate GitHub. Still gets the job done.",
    ),
    TechItemData(
      name: "DBeaver",
      icon: SimpleIcons.dbeaver,
      color: Color(0xFF382923),
      tooltip: "Because looking directly at the database feels reassuring.",
    ),
    TechItemData(
      name: "VS Code",
      icon: SimpleIcons.vscodium,
      color: Color(0xFF007ACC),
      tooltip: "Opened once. Closed... eventually.",
    ),
    TechItemData(
      name: "Android Studio",
      icon: SimpleIcons.androidstudio,
      color: Color(0xFF3DDC84),
      tooltip: "Mostly opened for the emulator. Occasionally survives longer.",
    ),
    TechItemData(
      name: "XCode",
      icon: SimpleIcons.xcode,
      color: Color(0xFF0B4A8C),
      tooltip: "Opened only when Apple insists.",
    ),
    TechItemData(
      name: "Antigravity",
      icon: SimpleIcons.googlegemini,
      color: Color(0xFF1A73E8),
      tooltip: "Helps turn half-baked ideas into actual features.",
    ),
    TechItemData(
      name: "Codex",
      icon: SimpleIcons.openaigym,
      color: Color(0xFF10A37F),
      tooltip: "Makes me look smarter than I probably am.",
    ),
    TechItemData(
      name: "Confluence",
      icon: SimpleIcons.confluence,
      color: Color(0xFF0052CC),
      tooltip: "Where documentation goes to become surprisingly useful.",
    ),
    TechItemData(
      name: "Jira",
      icon: SimpleIcons.jira,
      color: Color(0xFF0052CC),
      tooltip: "Turning \"I'll do it later\" into actual tickets.",
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
    // Title takes 80px, spacing takes 24px
    final double rem = totalWidth - 80 - 24;

    const double minSpacing = 8.0;
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
          padding: const EdgeInsets.only(top: 16.0),
          child: SizedBox(width: 80, child: _buildDesktopTitle()),
        ),
        const SizedBox(width: 24),
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
    const double minSpacing = 8.0;
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
        const SizedBox(height: 16),
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
    final textColor = isDark ? Colors.white : Colors.black;

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
                    fontSize: 20,
                  ) ??
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
            ),
            const SizedBox(width: 4),
            Text(
              "I",
              style:
                  context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.sparklePurple,
                    fontSize: 20,
                  ) ??
                  const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.sparklePurple,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        CornerHighlight(
          corner: SparkleCorner.rightCenter,
          color: AppColors.sparklePink.withValues(alpha: 0.6),
          lengthFactor: 0.6,
          strokeWidth: 2.0,
          extraSpread: 0.1,
          child: Padding(
            padding: const EdgeInsets.only(right: 6, bottom: 2),
            child: Text(
              "Use",
              style:
                  context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 20,
                  ) ??
                  TextStyle(
                    fontSize: 20,
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
    final textColor = isDark ? Colors.white : Colors.black;

    return CornerHighlight(
      corner: SparkleCorner.rightCenter,
      color: AppColors.sparklePink.withValues(alpha: 0.6),
      lengthFactor: 0.6,
      strokeWidth: 2.0,
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
                  fontSize: 18,
                ) ??
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
          ),
          SizedBox(width: AppConstants.spaceS),
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
    final bool showBelow = position.dy < 120;

    // Boundary check and horizontal shift calculation to keep bubble fully on screen
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final globalCenterX = position.dx + size.width / 2;

    double shiftX = 0.0;
    if (globalCenterX - 90 < 8) {
      shiftX = 8 - (globalCenterX - 90);
    } else if (globalCenterX + 90 > screenWidth - 8) {
      shiftX = (screenWidth - 8) - (globalCenterX + 90);
    }

    // Relative fraction of the tail location on the bubble width (180px)
    final double tailXOffset = (90 - shiftX) / 180;
    final double leftPos = position.dx - (180 - size.width) / 2 + shiftX;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: leftPos,
              top: showBelow ? position.dy + size.height + 6 : null,
              bottom: showBelow ? null : screenHeight - position.dy + 6,
              width: 180,
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
    final baseBg = isDark ? const Color(0xFF1A2035) : Colors.white;

    final resolvedColor =
        (widget.name == "Next.js" || widget.name == "GitHub")
            ? (isDark ? Colors.white : Colors.black)
            : widget.brandColor;

    final borderSide =
        _isHovered
            ? BorderSide(
              color: resolvedColor.withAlpha((0.8 * 255).round()),
              width: 1.5,
            )
            : BorderSide(color: AppColors.getBorder(context), width: 1.0);

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
                ? Matrix4.translationValues(0, -4.0, 0)
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
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
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
    final baseBg = isDark ? const Color(0xFF1A2035) : Colors.white;
    final accentColor = Theme.of(context).colorScheme.primary;

    final borderSide =
        _isHovered
            ? BorderSide(
              color: accentColor.withAlpha((0.8 * 255).round()),
              width: 1.5,
            )
            : BorderSide(color: AppColors.getBorder(context), width: 1.0);

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
                  ? Matrix4.translationValues(0, -4.0, 0)
                  : Matrix4.identity(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.isExpandButton ? Icons.more_horiz : Icons.expand_less,
                color: isDark ? Colors.white60 : Colors.black54,
                size: AppConstants.techIconSize,
              ),
              const SizedBox(height: 6),
              Text(
                widget.isExpandButton ? "More" : "Less",
                style: const TextStyle(
                  fontSize: 10,
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
