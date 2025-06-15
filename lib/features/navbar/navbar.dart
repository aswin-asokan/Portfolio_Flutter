import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/custom_container.dart';
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
  int selectedIndex = 0;

  void _scrollToSection(int index) {
    final keyContext = widget.sectionKeys[index].currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero, ancestor: null).dy;
      final offset =
          widget.scrollController.offset + position - kToolbarHeight - 30;

      widget.scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      setState(() {
        selectedIndex = index;
      });
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
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.sections.length, (index) {
              final isSelected = selectedIndex == index;
              return ListTile(
                title: Center(
                  child: Text(
                    widget.sections[index],
                    style: context.textTheme.labelSmall?.copyWith(
                      fontSize: 25,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color:
                          isSelected
                              ? Theme.of(context).colorScheme.primary
                              : null,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close bottom sheet
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
    return CustomContainer(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.isBackEnabled
                ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      spacing: 8,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 16,
                          color: context.colorScheme.primary,
                        ),
                        if (!Responsive.isMobile(context))
                          Text(
                            "Go back",
                            style: context.textTheme.labelMedium!.copyWith(
                              fontSize: 16,
                            ),
                          ),
                      ],
                    ),
                  ),
                )
                : Image.network(
                  Theme.of(context).brightness == Brightness.dark
                      ? "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/images/logo/dark_logo.png"
                      : "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/main/assets/images/logo/light_logo.png",
                  height: 30,
                ),
            Row(
              children: [
                if (Responsive.isTablet(context) ||
                    Responsive.isDesktop(context) ||
                    Responsive.isDesktopLarge(context))
                  Row(
                    children: List.generate(widget.sections.length, (index) {
                      final isSelected = selectedIndex == index;
                      return Padding(
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
                      );
                    }),
                  ),
                if (Responsive.isMobile(context) ||
                    Responsive.isSmallTablet(context))
                  IconButton(
                    onPressed: _openBottomNavMenu,
                    icon: Icon(Symbols.menu),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
