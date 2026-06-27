import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:simple_icons/simple_icons.dart';

class TechItemData {
  final String name;
  final IconData icon;
  final Color color;

  const TechItemData({
    required this.name,
    required this.icon,
    required this.color,
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
      name: "HTML",
      icon: SimpleIcons.html5,
      color: Color(0xFFE34F26),
    ),
    TechItemData(name: "CSS", icon: SimpleIcons.css, color: Color(0xFF1572B6)),
    TechItemData(
      name: "JavaScript",
      icon: SimpleIcons.javascript,
      color: Color(0xFFF7DF1E),
    ),
    TechItemData(
      name: "TypeScript",
      icon: SimpleIcons.typescript,
      color: Color(0xFF3178C6),
    ),
    TechItemData(
      name: "React",
      icon: SimpleIcons.react,
      color: Color(0xFF61DAFB),
    ),
    TechItemData(
      name: "Next.js",
      icon: SimpleIcons.nextdotjs,
      color: Colors.black,
    ),
    TechItemData(
      name: "Tailwind",
      icon: SimpleIcons.tailwindcss,
      color: Color(0xFF06B6D4),
    ),
    TechItemData(name: "Git", icon: SimpleIcons.git, color: Color(0xFFF05032)),
    TechItemData(
      name: "VS Code",
      icon: SimpleIcons.claudecode,
      color: Color(0xFF007ACC),
    ),
    TechItemData(
      name: "Flutter",
      icon: SimpleIcons.flutter,
      color: Color(0xFF02569B),
    ),
    TechItemData(
      name: "Dart",
      icon: SimpleIcons.dart,
      color: Color(0xFF0175C2),
    ),
    TechItemData(
      name: "Firebase",
      icon: SimpleIcons.firebase,
      color: Color(0xFFFFCA28),
    ),
    TechItemData(
      name: "Node.js",
      icon: SimpleIcons.nodedotjs,
      color: Color(0xFF339933),
    ),
    TechItemData(name: "GitHub", icon: SimpleIcons.github, color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
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
    );
  }

  Widget _buildDesktopLayout(double totalWidth) {
    // Title takes 80px, spacing takes 24px
    final double rem = totalWidth - 80 - 24;

    // Collapsed item limit math:
    // rem >= N * (itemSize + spacing) + itemSize => N = (rem - itemSize) / (itemSize + spacing)
    final int maxItems =
        ((rem - AppConstants.techItemSize) /
                (AppConstants.techItemSize + AppConstants.techSpacing))
            .floor();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SizedBox(width: 80, child: _buildDesktopTitle()),
        ),
        const SizedBox(width: 24),
        Expanded(
          child:
              _isExpanded
                  ? Wrap(
                    spacing: AppConstants.techSpacing,
                    runSpacing: AppConstants.techSpacing,
                    children: [
                      ...techItems.map(
                        (item) => TechItemCard(
                          name: item.name,
                          icon: item.icon,
                          brandColor: item.color,
                        ),
                      ),
                      ToggleExpandCard(
                        isExpandButton: false,
                        onTap: () => setState(() => _isExpanded = false),
                      ),
                    ],
                  )
                  : Row(
                    spacing: AppConstants.techSpacing,
                    children: [
                      ...techItems
                          .take(maxItems)
                          .map(
                            (item) => TechItemCard(
                              name: item.name,
                              icon: item.icon,
                              brandColor: item.color,
                            ),
                          ),
                      ToggleExpandCard(
                        isExpandButton: true,
                        onTap: () => setState(() => _isExpanded = true),
                      ),
                    ],
                  ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(double totalWidth) {
    // Title is above items, so we have full width inside card (totalWidth)
    final int maxItems =
        ((totalWidth - AppConstants.techItemSize) /
                (AppConstants.techItemSize + AppConstants.techSpacing))
            .floor();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildMobileTitle(),
        const SizedBox(height: 16),
        _isExpanded
            ? Wrap(
              spacing: AppConstants.techSpacing,
              runSpacing: AppConstants.techSpacing,
              children: [
                ...techItems.map(
                  (item) => TechItemCard(
                    name: item.name,
                    icon: item.icon,
                    brandColor: item.color,
                  ),
                ),
                ToggleExpandCard(
                  isExpandButton: false,
                  onTap: () => setState(() => _isExpanded = false),
                ),
              ],
            )
            : Row(
              spacing: AppConstants.techSpacing,
              children: [
                ...techItems
                    .take(maxItems)
                    .map(
                      (item) => TechItemCard(
                        name: item.name,
                        icon: item.icon,
                        brandColor: item.color,
                      ),
                    ),
                ToggleExpandCard(
                  isExpandButton: true,
                  onTap: () => setState(() => _isExpanded = true),
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

  const TechItemCard({
    super.key,
    required this.name,
    required this.icon,
    required this.brandColor,
  });

  @override
  State<TechItemCard> createState() => _TechItemCardState();
}

class _TechItemCardState extends State<TechItemCard> {
  bool _isHovered = false;

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
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        width: AppConstants.techItemSize,
        height: AppConstants.techItemSize,
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

  const ToggleExpandCard({
    super.key,
    required this.isExpandButton,
    required this.onTap,
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
          width: AppConstants.techItemSize,
          height: AppConstants.techItemSize,
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
