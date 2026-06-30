import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/core/themes/theme_provider.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:portfolio/responsive/responsive.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
    required this.sectionKeys,
    required this.scrollController,
    required this.sections,
    this.isBackEnabled = false,
  });

  final List<GlobalKey> sectionKeys;
  final List<String> sections;
  final ScrollController scrollController;
  final bool isBackEnabled;
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int? selectedIndex;

  void _scrollToSection(int index, {bool updateSelection = true}) {
    final keyContext = widget.sectionKeys[index].currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero).dy;
      final offset =
          widget.scrollController.offset + position - kToolbarHeight - 30;

      widget.scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    if (updateSelection) {
      setState(() {
        selectedIndex = index;
      });

      // On mobile, reset the selection highlight after a short delay
      if (Responsive.isMobile(context) || Responsive.isSmallTablet(context)) {
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) setState(() => selectedIndex = null);
        });
      }
    }
  }

  void _openBottomNavMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.sections.length, (index) {
              return ListTile(
                title: Center(
                  child: Text(
                    widget.sections[index],
                    style: context.textTheme.labelSmall?.copyWith(fontSize: 25),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(index);
                },
              );
            }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isExpanded =
        Responsive.isTablet(context) ||
        Responsive.isDesktop(context) ||
        Responsive.isDesktopLarge(context);

    // Logo / Back button Widget
    final Widget logoSection =
        widget.isBackEnabled
            ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 16,
                      color: context.colorScheme.primary,
                    ),
                    if (!Responsive.isMobile(context)) const SizedBox(width: 8),
                    if (!Responsive.isMobile(context))
                      Text(
                        "Go back",
                        style: context.textTheme.labelMedium?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),
              ),
            )
            : MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  _scrollToSection(0);
                },
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? "assets/images/logo/dark_logo.png"
                      : "assets/images/logo/light_logo.png",
                  height: 30,
                  cacheWidth: 200,
                  gaplessPlayback: true,
                ),
              ),
            );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.getBorder(context)),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        color:
            Theme.of(context).brightness == Brightness.dark
                ? AppColors.scaffoldDarkColor
                : AppColors.scaffoldLightColor,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            // Left: Logo / Back button
            Expanded(
              child: Align(alignment: Alignment.centerLeft, child: logoSection),
            ),

            // Center: Navigation Links (only in expanded mode)
            if (isExpanded)
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(widget.sections.length, (index) {
                    final isSelected = selectedIndex == index;
                    return MouseRegion(
                      onEnter: (_) => setState(() => selectedIndex = index),
                      onExit: (_) {
                        if (!Responsive.isMobile(context)) {
                          setState(() => selectedIndex = null);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextButton(
                          onPressed: () => _scrollToSection(index),
                          child: Text(
                            widget.sections[index],
                            style: context.textTheme.labelSmall?.copyWith(
                              color:
                                  isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

            // Right: Actions (Theme switcher & Let's Talk! button or Hamburger menu)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Theme switcher
                    IconButton(
                      onPressed: () {
                        Provider.of<ThemeProvider>(
                          context,
                          listen: false,
                        ).toggleTheme(context);
                      },
                      icon: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Symbols.wb_sunny
                            : Symbols.moon_stars,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Expanding actions / hamburger
                    if (isExpanded)
                      CornerHighlight(
                        lengthFactor: 0.5,
                        strokeWidth: 2.4,
                        corner: SparkleCorner.topRight,
                        child: CustomButton.filled(
                          label: "Let's Talk!",
                          onPress: () {
                            final int contactIndex = widget.sections.indexWhere(
                              (s) => s.toLowerCase() == "contact",
                            );
                            if (contactIndex != -1) {
                              _scrollToSection(
                                contactIndex,
                                updateSelection: false,
                              );
                            }
                          },
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.lightButton
                                  : AppColors.darkButton,
                          suffixIcon: Icon(
                            Symbols.chat_bubble,
                            fill: 1,
                            size: AppConstants.iconSizeS,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.darkButton
                                    : AppColors.lightButton,
                          ),
                        ),
                      )
                    else
                      IconButton(
                        onPressed: _openBottomNavMenu,
                        icon: const Icon(Symbols.menu),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
