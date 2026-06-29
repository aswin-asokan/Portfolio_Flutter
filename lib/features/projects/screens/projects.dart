import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/project_list/project_list.dart';
import 'package:portfolio/features/shared/widgets/shimmer_placeholder.dart';

class Projects extends StatefulWidget {
  final double? forcedWidth;
  const Projects({super.key, this.forcedWidth});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheProjectImages();
    });
  }

  Future<void> _precacheProjectImages() async {
    try {
      for (final app in projects) {
        if (!mounted) return;
        if (app.screenshots.isNotEmpty) {
          precacheImage(
            CachedNetworkImageProvider(app.screenshots[0]),
            context,
            onError: (exception, stackTrace) {},
          );
        }
        precacheImage(
          CachedNetworkImageProvider(app.bannerPath),
          context,
          onError: (exception, stackTrace) {},
        );
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: context.colorScheme.surface,
        border: Border.all(color: AppColors.getBorder(context), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                    "Projects",
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
              // Interactive View All text button
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    context.push('/projects');
                  },
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
          if (widget.forcedWidth != null)
            Expanded(
              child: _buildCardsRow(context, widget.forcedWidth!),
            )
          else
            LayoutBuilder(
              builder: (context, constraints) =>
                  _buildCardsRow(context, constraints.maxWidth),
            ),
        ],
      ),
    );
  }

  Widget _buildCardsRow(BuildContext context, double availableWidth) {
    final double spacing = 16.0;
    final double baseCardWidth = 190.0;

    int fitCount = (availableWidth + spacing) ~/ (baseCardWidth + spacing);
    fitCount = fitCount.clamp(1, projects.length);
    final double cardWidth = (availableWidth - (fitCount - 1) * spacing) / fitCount;

    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: IntrinsicHeight(
              child: Row(
                spacing: spacing,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < fitCount; i++)
                    _ProjectCard(
                      app: projects[i],
                      index: i,
                      width: cardWidth,
                    ),
                  SizedBox(width: spacing),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          width: 40,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    context.colorScheme.surface.withOpacity(0.0),
                    context.colorScheme.surface.withOpacity(0.85),
                    context.colorScheme.surface,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectTheme {
  final Color bgColor;
  final Color borderColor;

  ProjectTheme({required this.bgColor, required this.borderColor});
}

ProjectTheme _getProjectTheme(BuildContext context, int index) {
  final bool isDark = Theme.of(context).brightness == Brightness.dark;
  final int colorIndex = index % 3;

  if (colorIndex == 0) {
    // Lavender
    return ProjectTheme(
      bgColor: isDark ? const Color(0xFF1B1633) : const Color(0xFFF1EFFF),
      borderColor: isDark ? const Color(0xFF382E66) : const Color(0xFFDCD8FF),
    );
  } else if (colorIndex == 1) {
    // Mint/Green
    return ProjectTheme(
      bgColor: isDark ? const Color(0xFF0A2316) : const Color(0xFFEBF7EE),
      borderColor: isDark ? const Color(0xFF1E3A2F) : const Color(0xFFCEEBDC),
    );
  } else {
    // Orange/Yellow
    return ProjectTheme(
      bgColor: isDark ? const Color(0xFF2E1C0A) : const Color(0xFFFFF3E0),
      borderColor: isDark ? const Color(0xFF4E3629) : const Color(0xFFFFE0B2),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final AppModel app;
  final int index;
  final double width;

  const _ProjectCard({
    required this.app,
    required this.index,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = _getProjectTheme(context, index);
    final String cleanTitle = app.title.replaceAll("Trelza ", "");

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.push('/app/${app.id}');
        },
        child: Container(
          width: width,
          height: 370,
          decoration: BoxDecoration(
            color: theme.bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.borderColor,
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Image (extends to top/left/right edges)
              AspectRatio(
                aspectRatio: 1.2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(11),
                    topRight: Radius.circular(11),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: app.screenshots.isNotEmpty ? app.screenshots[0] : app.bannerPath,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    placeholder: (context, url) => const ShimmerPlaceholder(),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: const Icon(
                        Symbols.phone_iphone,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              // 2. Padding wrapper for text and arrow
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        cleanTitle,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: context.colorScheme.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Description
                      Text(
                        app.caption,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.getDescriptionText(context),
                          fontSize: 13,
                          height: 1.3,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      // Arrow Icon
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Symbols.arrow_outward,
                          size: 20,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
