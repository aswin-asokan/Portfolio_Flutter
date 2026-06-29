import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/features/navbar/navbar.dart';
import 'package:portfolio/features/footer/screens/footer.dart';
import 'package:portfolio/features/hero/widgets/hero_image.dart';
import 'package:portfolio/features/app_page/models/app_model.dart';
import 'package:portfolio/features/shared/project_list/project_list.dart';
import 'package:portfolio/features/shared/widgets/shimmer_placeholder.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class FilterCategory {
  final String name;
  final Widget icon;
  final Color selectedBg;
  final Color selectedText;

  const FilterCategory({
    required this.name,
    required this.icon,
    required this.selectedBg,
    required this.selectedText,
  });
}

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  String _selectedCategory = "All";
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(1, (_) => GlobalKey());

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _matchesCategory(AppModel app, String category) {
    if (category == "All") return true;

    final String techStackLower = app.techStack.toLowerCase();

    if (category == "Flutter") {
      return techStackLower.contains("flutter");
    }
    if (category == "Web") {
      return techStackLower.contains("web") ||
          techStackLower.contains("react") ||
          techStackLower.contains("html") ||
          techStackLower.contains("css");
    }
    if (category == "Tools") {
      return techStackLower.contains("api") ||
          techStackLower.contains("sql") ||
          techStackLower.contains("hive") ||
          techStackLower.contains("json") ||
          techStackLower.contains("sqlite") ||
          app.id == "peekpub" ||
          app.id == "system_monitor" ||
          app.id == "dairy_management" ||
          app.id == "taskevo";
    }
    if (category == "AI / ML") {
      return techStackLower.contains("ai") ||
          techStackLower.contains("ml") ||
          techStackLower.contains("gemini") ||
          techStackLower.contains("bert") ||
          techStackLower.contains("t5") ||
          techStackLower.contains("clip") ||
          techStackLower.contains("sam") ||
          techStackLower.contains("lora") ||
          app.id == "steel_defect";
    }
    if (category == "Other") {
      final bool isFlutter = techStackLower.contains("flutter");
      final bool isWeb = techStackLower.contains("web") || techStackLower.contains("react");
      final bool isTools = techStackLower.contains("api") ||
          techStackLower.contains("sql") ||
          techStackLower.contains("hive") ||
          techStackLower.contains("json") ||
          techStackLower.contains("sqlite") ||
          app.id == "peekpub" ||
          app.id == "system_monitor" ||
          app.id == "dairy_management" ||
          app.id == "taskevo";
      final bool isAI = techStackLower.contains("ai") ||
          techStackLower.contains("ml") ||
          techStackLower.contains("gemini") ||
          techStackLower.contains("bert") ||
          techStackLower.contains("t5") ||
          techStackLower.contains("clip") ||
          techStackLower.contains("sam") ||
          techStackLower.contains("lora") ||
          app.id == "steel_defect";
      return !isFlutter && !isWeb && !isTools && !isAI;
    }
    return false;
  }

  Color _getBgColor(BuildContext context, FilterCategory cat, bool isSelected) {
    if (!isSelected) return Colors.transparent;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return cat.selectedText.withAlpha((0.2 * 255).round());
    }
    return cat.selectedBg;
  }

  Color _getTextColor(BuildContext context, FilterCategory cat, bool isSelected) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isSelected) {
      return _getSelectedTextColor(cat.selectedText, isDark);
    }
    return isDark ? Colors.white70 : Colors.black87;
  }

  Color _getSelectedTextColor(Color lightColor, bool isDark) {
    if (!isDark) return lightColor;
    if (lightColor == const Color(0xFF6F52F6)) return const Color(0xFF9F88FF); // Purple
    if (lightColor == const Color(0xFF0288D1)) return const Color(0xFF4FC3F7); // Blue
    if (lightColor == const Color(0xFF00796B)) return const Color(0xFF4DB6AC); // Teal
    if (lightColor == const Color(0xFFF57C00)) return const Color(0xFFFFB74D); // Orange
    if (lightColor == const Color(0xFF7B1FA2)) return const Color(0xFFBA68C8); // Purple/Pink
    if (lightColor == const Color(0xFF455A64)) return const Color(0xFFB0BEC5); // Grey
    return lightColor;
  }

  Widget _buildHeaderLeft(BuildContext context, double baseFontSize) {
    final bool isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Tag badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.getOhHeyBg(context),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.getOhHeyText(context).withAlpha((0.3 * 255).round()),
              width: 1,
            ),
          ),
          child: Text(
            "All Projects 🌟",
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.getOhHeyText(context),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Title
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Things I've\n",
                style: TextStyle(color: context.colorScheme.onSurface),
              ),
              TextSpan(
                text: "Built ",
                style: TextStyle(color: context.colorScheme.primary),
              ),
              TextSpan(
                text: "💖",
                style: TextStyle(fontSize: baseFontSize * 0.85),
              ),
            ],
          ),
          style: GoogleFonts.comicRelief(
            fontSize: baseFontSize,
            height: 1.1,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        // Paragraph description
        Text(
          "A collection of apps, tools, and experiments I've crafted with code, creativity, and lots of ☕.",
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.getDescriptionText(context),
            fontSize: isMobile ? 14 : 16,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        // Back to home button
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ElevatedButton.icon(
            onPressed: () => context.go('/'),
            icon: Icon(
              Symbols.arrow_back,
              size: 18,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkButton
                  : AppColors.lightButton,
            ),
            label: Text(
              "Back to Home",
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkButton
                    : AppColors.lightButton,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.lightButton
                  : AppColors.darkButton,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double padding = Responsive.padding(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isSmallTablet = Responsive.isSmallTablet(context);
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Font size scaling matching home page exactly
    final double baseFontSize = isMobile
        ? 36
        : (Responsive.isDesktopLarge(context)
            ? 70
            : Responsive.isDesktop(context)
            ? 60
            : Responsive.isTablet(context)
            ? 50
            : 40);

    // Filter projects list
    final filteredProjects = projects.where((p) => _matchesCategory(p, _selectedCategory)).toList();

    // Determine grid columns dynamically based on screen width (Minimum 2 columns)
    final int crossAxisCount = screenWidth < 600
        ? 2 // Min number of items per row is 2!
        : screenWidth < 900
            ? 3
            : screenWidth < 1200
                ? 4
                : 5;

    // Chunk projects list into rows of size crossAxisCount
    final List<List<AppModel>> chunkedProjects = [];
    for (int i = 0; i < filteredProjects.length; i += crossAxisCount) {
      final end = (i + crossAxisCount < filteredProjects.length)
          ? i + crossAxisCount
          : filteredProjects.length;
      chunkedProjects.add(filteredProjects.sublist(i, end));
    }

    // Note: To add more filter options from code, simply add a new FilterCategory to this list!
    // Increased Icon Size to 22 for filter chips
    final List<FilterCategory> categories = [
      FilterCategory(
        name: "All",
        icon: Icon(
          Symbols.grid_view,
          size: 22,
          color: _selectedCategory == "All" 
              ? const Color(0xFF6F52F6) 
              : (isDark ? Colors.white70 : Colors.black87),
        ),
        selectedBg: isDark ? const Color(0xFF2C244C) : const Color(0xFFE8E4FF),
        selectedText: const Color(0xFF6F52F6),
      ),
      FilterCategory(
        name: "Flutter",
        icon: Icon(
          SimpleIcons.flutter,
          size: 22,
          color: _selectedCategory == "Flutter" 
              ? const Color(0xFF0288D1) 
              : (isDark ? Colors.white70 : Colors.black87),
        ),
        selectedBg: isDark ? const Color(0xFF0A304E) : const Color(0xFFE3F2FD),
        selectedText: const Color(0xFF0288D1),
      ),
      FilterCategory(
        name: "Web",
        icon: Icon(
          Symbols.language,
          size: 22,
          color: _selectedCategory == "Web" 
              ? const Color(0xFF00796B) 
              : (isDark ? Colors.white70 : Colors.black87),
        ),
        selectedBg: isDark ? const Color(0xFF0A3C36) : const Color(0xFFE0F2F1),
        selectedText: const Color(0xFF00796B),
      ),
      FilterCategory(
        name: "Tools",
        icon: Icon(
          Symbols.construction,
          size: 22,
          color: _selectedCategory == "Tools" 
              ? const Color(0xFFF57C00) 
              : (isDark ? Colors.white70 : Colors.black87),
        ),
        selectedBg: isDark ? const Color(0xFF4E2A0A) : const Color(0xFFFFF3E0),
        selectedText: const Color(0xFFF57C00),
      ),
      FilterCategory(
        name: "AI / ML",
        icon: Icon(
          Symbols.psychology,
          size: 22,
          color: _selectedCategory == "AI / ML" 
              ? const Color(0xFF7B1FA2) 
              : (isDark ? Colors.white70 : Colors.black87),
        ),
        selectedBg: isDark ? const Color(0xFF3F134A) : const Color(0xFFF3E5F5),
        selectedText: const Color(0xFF7B1FA2),
      ),
      FilterCategory(
        name: "Other",
        icon: Icon(
          Symbols.more_horiz,
          size: 22,
          color: _selectedCategory == "Other" 
              ? const Color(0xFF455A64) 
              : (isDark ? Colors.white70 : Colors.black87),
        ),
        selectedBg: isDark ? const Color(0xFF2C3539) : const Color(0xFFECEFF1),
        selectedText: const Color(0xFF455A64),
      ),
    ];

    // Determine filter bar columns based on screen width (for full row stretching)
    final int filterCols = screenWidth < 500
        ? 2 // 3 rows of 2
        : screenWidth < 800
            ? 3 // 2 rows of 3
            : 6; // 1 row of 6

    final List<List<FilterCategory>> chunkedCats = [];
    for (int i = 0; i < categories.length; i += filterCols) {
      final end = (i + filterCols < categories.length)
          ? i + filterCols
          : categories.length;
      chunkedCats.add(categories.sublist(i, end));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SelectionArea(
        child: Stack(
          children: [
            // Scrollable Content
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Spacing for navbar
                    SizedBox(
                      height: (isMobile || isSmallTablet) ? 85 : 70,
                      key: _sectionKeys[0],
                    ),
                    const SizedBox(height: 20),

                    // Top responsive section (Row/Column) matching hero layout exactly
                    if (!isMobile)
                      ConstrainedBox(
                        constraints: BoxConstraints(minHeight: isSmallTablet ? 0.0 : 450.0),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: _buildHeaderLeft(context, baseFontSize)),
                              const SizedBox(width: 40),
                              const Expanded(child: HeroImage()),
                            ],
                          ),
                        ),
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeaderLeft(context, baseFontSize),
                          const SizedBox(height: 20),
                          const HeroImage(),
                        ],
                      ),

                    const SizedBox(height: 40),

                    // Filter Bar: Segmented control style that stretches dynamically (removes empty space)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.getBorder(context), width: 1.5),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13.5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(chunkedCats.length * 2 - 1, (index) {
                            if (index.isOdd) {
                              // Horizontal separator between wrapped filter rows (does not reach outer container edges)
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Container(
                                  height: 1.5,
                                  color: AppColors.getBorder(context),
                                ),
                              );
                            }

                            final rowIndex = index ~/ 2;
                            final rowChunk = chunkedCats[rowIndex];

                            return IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: List.generate(rowChunk.length * 2 - 1, (colIndex) {
                                  if (colIndex.isOdd) {
                                    // Vertical separator line (has vertical margins, does not touch top/bottom edges)
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Container(
                                        width: 1.5,
                                        color: AppColors.getBorder(context),
                                      ),
                                    );
                                  }

                                  final itemIndex = colIndex ~/ 2;
                                  final cat = rowChunk[itemIndex];
                                  final isSelected = _selectedCategory == cat.name;

                                  return Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4), // Floating pill effect padding
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedCategory = cat.name;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 200),
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: _getBgColor(context, cat, isSelected),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                cat.icon,
                                                const SizedBox(width: 8),
                                                Text(
                                                  cat.name,
                                                  style: context.textTheme.bodySmall?.copyWith(
                                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                                    color: _getTextColor(context, cat, isSelected),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Grid of filtered projects (Equal height rows using IntrinsicHeight)
                    if (filteredProjects.isEmpty)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 60),
                          child: Text(
                            "No projects found in this category.",
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.getDescriptionText(context),
                            ),
                          ),
                        ),
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(chunkedProjects.length, (rowIndex) {
                          final chunk = chunkedProjects[rowIndex];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: rowIndex < chunkedProjects.length - 1 ? 16.0 : 0.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: List.generate(crossAxisCount * 2 - 1, (index) {
                                  if (index.isOdd) {
                                    return const SizedBox(width: 16); // Horizontal space between cards
                                  }
                                  final colIndex = index ~/ 2;
                                  if (colIndex < chunk.length) {
                                    return Expanded(
                                      child: ProjectGridCard(
                                        app: chunk[colIndex],
                                        index: rowIndex * crossAxisCount + colIndex,
                                      ),
                                    );
                                  } else {
                                    // Dummy card widget space container to balance layout width
                                    return const Expanded(child: SizedBox.shrink());
                                  }
                                }),
                              ),
                            ),
                          );
                        }),
                      ),

                    const SizedBox(height: 50),
                    const Footer(),
                  ],
                ),
              ),
            ),
            // Floating Top Navbar
            Positioned(
              top: 20,
              left: padding,
              right: padding,
              child: Navbar(
                sectionKeys: _sectionKeys,
                scrollController: _scrollController,
                isBackEnabled: true,
                sections: const [
                  "Projects",
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardThemeColor {
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final Color badgeBg;
  final Color badgeText;

  const CardThemeColor({
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    required this.badgeBg,
    required this.badgeText,
  });
}

class ProjectGridCard extends StatefulWidget {
  final AppModel app;
  final int index;
  const ProjectGridCard({
    super.key,
    required this.app,
    required this.index,
  });

  @override
  State<ProjectGridCard> createState() => _ProjectGridCardState();
}

class _ProjectGridCardState extends State<ProjectGridCard> {
  bool _isHovered = false;

  CardThemeColor _getCardTheme(BuildContext context, int index) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final int colorIndex = index % 4;

    if (colorIndex == 0) {
      // Lavender
      return CardThemeColor(
        bgColor: isDark ? const Color(0xFF1B1633) : const Color(0xFFF1EFFF),
        borderColor: isDark ? const Color(0xFF382E66) : const Color(0xFFDCD8FF),
        textColor: isDark ? const Color(0xFFE1D3FF) : const Color(0xFF5E35B1),
        badgeBg: isDark ? const Color(0xFF2C244C) : const Color(0xFFE8E4FF),
        badgeText: isDark ? const Color(0xFFB39DFF) : const Color(0xFF6F52F6),
      );
    } else if (colorIndex == 1) {
      // Mint/Green
      return CardThemeColor(
        bgColor: isDark ? const Color(0xFF0A2316) : const Color(0xFFEBF7EE),
        borderColor: isDark ? const Color(0xFF1E3A2F) : const Color(0xFFCEEBDC),
        textColor: isDark ? const Color(0xFFA3E2C9) : const Color(0xFF2E7D32),
        badgeBg: isDark ? const Color(0xFF133221) : const Color(0xFFE8F5E9),
        badgeText: isDark ? const Color(0xFF81C784) : const Color(0xFF2E7D32),
      );
    } else if (colorIndex == 2) {
      // Orange/Yellow
      return CardThemeColor(
        bgColor: isDark ? const Color(0xFF2E1C0A) : const Color(0xFFFFF3E0),
        borderColor: isDark ? const Color(0xFF4E3629) : const Color(0xFFFFE0B2),
        textColor: isDark ? const Color(0xFFFFCC80) : const Color(0xFFEF6C00),
        badgeBg: isDark ? const Color(0xFF3E2712) : const Color(0xFFFFF3E0),
        badgeText: isDark ? const Color(0xFFFFB74D) : const Color(0xFFEF6C00),
      );
    } else {
      // Pink/Red
      return CardThemeColor(
        bgColor: isDark ? const Color(0xFF33161C) : const Color(0xFFFFEBEE),
        borderColor: isDark ? const Color(0xFF5C2932) : const Color(0xFFFFCDD2),
        textColor: isDark ? const Color(0xFFFFCCD5) : const Color(0xFFC2185B),
        badgeBg: isDark ? const Color(0xFF4A1F26) : const Color(0xFFFFEBEE),
        badgeText: isDark ? const Color(0xFFFF8A80) : const Color(0xFFC2185B),
      );
    }
  }

  String _getPrimaryTech(AppModel app) {
    final tech = app.techStack.toLowerCase();
    if (tech.contains("flutter")) return "• Flutter";
    if (tech.contains("react") || tech.contains("web")) return "• Web";
    if (tech.contains("python")) return "• Python";
    if (tech.contains("java")) return "• Java";
    if (tech.contains("arduino")) return "• Arduino";
    return "• Other";
  }

  @override
  Widget build(BuildContext context) {
    final theme = _getCardTheme(context, widget.index);
    final primaryTech = _getPrimaryTech(widget.app);
    final String cleanTitle = widget.app.title.replaceAll("Trelza ", "");
    final List<String> tags = widget.app.techStack
        .split(RegExp(r'\s*\|\s*|\s*,\s*'))
        .where((t) => t.trim().isNotEmpty)
        .toList();
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Tech stack chip background color (theme-aware)
    final chipBg = isDark ? context.colorScheme.surface : Colors.white;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          context.push('/app/${widget.app.id}');
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 255),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: theme.bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? theme.textColor.withOpacity(0.8) : theme.borderColor,
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: theme.textColor.withOpacity(0.15),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Image not meeting edges and having rounded corners
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: AspectRatio(
                  aspectRatio: 2.1, // Aspect ratio of image remains fixed
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: widget.app.screenshots.isNotEmpty 
                                ? widget.app.screenshots[0] 
                                : widget.app.bannerPath,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            placeholder: (context, url) => const ShimmerPlaceholder(),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey.shade200,
                              alignment: Alignment.center,
                              child: const Icon(
                                Symbols.broken_image,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: theme.bgColor, // same color as card!
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: theme.borderColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            primaryTech,
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: theme.textColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Card Details: Expands naturally to fit content dynamically
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        cleanTitle,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: context.colorScheme.onSurface,
                        ),
                        maxLines: 2, // Allow wrapping
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Description
                      Text(
                        widget.app.caption,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.getDescriptionText(context),
                          fontSize: 11.5,
                          height: 1.25,
                        ),
                        maxLines: 3, // Allow wrapping up to 3 lines
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                      // Spacer expands to align bottom content of equal-height cards
                      const Spacer(),
                      const SizedBox(height: 8),

                      // Tech Tags
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: tags.take(3).map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: chipBg,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: theme.borderColor,
                                width: 0.8,
                              ),
                            ),
                            child: Text(
                              tag.trim(),
                              style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 9.5,
                                color: theme.textColor,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 8),
                      // View link
                      Row(
                        children: [
                          Text(
                            "View Project",
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Symbols.arrow_forward,
                            size: 12,
                            color: context.colorScheme.onSurface,
                          ),
                        ],
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
