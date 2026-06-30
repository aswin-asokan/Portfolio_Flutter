import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/about/screens/about_me.dart';
import 'package:portfolio/features/about/widgets/tech_i_use.dart';
import 'package:portfolio/features/contact/screens/contact_me.dart';
import 'package:portfolio/features/education/screens/education.dart';
import 'package:portfolio/features/experience/screens/experience.dart';
import 'package:portfolio/features/footer/screens/footer.dart';
import 'package:portfolio/features/hero/screens/hero_container.dart';
import 'package:portfolio/features/anilist/screens/anilist_section.dart';
import 'package:portfolio/features/navbar/navbar.dart';
import 'package:portfolio/features/pinterest/screens/pinterest_section.dart';
import 'package:portfolio/features/projects/screens/projects.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/features/shared/widgets/toast.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<GlobalKey> sectionKeys = List.generate(5, (_) => GlobalKey());
  final ScrollController scrollController = ScrollController();
  bool _isAnilistVisible = false;
  bool _isExperienceExpanded = false;
  double? _experienceExpandedHeight;
  static bool _hasShownToast = false;

  @override
  void initState() {
    super.initState();
    if (!_hasShownToast) {
      _hasShownToast = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          showToast(context, "Work in Progress, Prone to changes. Continuously shipping questionable decisions!");
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  double padding = 60;

  @override
  Widget build(BuildContext context) {
    padding = Responsive.padding(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SelectionArea(
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: 20,
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 90,
                      key: sectionKeys[0],
                    ), // Space for navbar
                    RepaintBoundary(
                      child: HeroSection(
                        onViewWorkPressed: () => scrollTo(sectionKeys[3]),
                      ),
                    ),
                    SizedBox(height: AppConstants.spaceM, key: sectionKeys[1]),
                    RepaintBoundary(
                      child: AboutMe(onNavigate: scrollTo, contactKey: sectionKeys[4]),
                    ),
                    const RepaintBoundary(
                      child: TechIUse(),
                    ),
                    if (MediaQuery.sizeOf(context).width >= 1024) ...[
                      Builder(
                        builder: (context) {
                          final double contentWidth = MediaQuery.sizeOf(context).width - 2 * padding;
                          final double normalProjectsWidth = (contentWidth - 20) / 2 - 48;
                          final double expandedProjectsWidth = contentWidth - 48;

                          final double expLeft = 0;
                          final double expTop = 0;
                          final double expWidth = _isExperienceExpanded ? contentWidth : (contentWidth - 20) / 2;
                          
                          final double expHeight;
                          if (!_isExperienceExpanded) {
                            expHeight = 520.0;
                          } else {
                            expHeight = _experienceExpandedHeight ??
                                (contentWidth < 1100
                                    ? 560.0
                                    : contentWidth < 1300
                                        ? 500.0
                                        : 460.0);
                          }

                          final double projLeft = _isExperienceExpanded ? 0 : (contentWidth - 20) / 2 + 20;
                          final double projTop = _isExperienceExpanded ? expHeight + 20 : 0;
                          final double projWidth = _isExperienceExpanded ? contentWidth : (contentWidth - 20) / 2;
                          final double projHeight = _isExperienceExpanded ? 520.0 : 520.0;

                          final double totalHeight = _isExperienceExpanded
                              ? expHeight + projHeight + 20
                              : 520.0;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            height: totalHeight,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  left: expLeft,
                                  top: expTop,
                                  width: expWidth,
                                  height: expHeight,
                                  child: ClipRect(
                                    child: RepaintBoundary(
                                      child: Experience(
                                        key: sectionKeys[2],
                                        isExpanded: _isExperienceExpanded,
                                        forcedWidth: _isExperienceExpanded ? contentWidth : null,
                                        onToggleExpand: () {
                                          setState(() {
                                            _isExperienceExpanded = !_isExperienceExpanded;
                                            if (!_isExperienceExpanded) {
                                              _experienceExpandedHeight = null;
                                            }
                                          });
                                        },
                                        onHeightMeasured: (height) {
                                          if (_experienceExpandedHeight != height) {
                                            setState(() {
                                              _experienceExpandedHeight = height;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  left: projLeft,
                                  top: projTop,
                                  width: projWidth,
                                  height: projHeight,
                                  child: ClipRect(
                                    child: RepaintBoundary(
                                      child: Projects(
                                        key: sectionKeys[3],
                                        forcedWidth: _isExperienceExpanded
                                            ? expandedProjectsWidth
                                            : normalProjectsWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const RepaintBoundary(
                        child: Education(),
                      ),
                    ] else ...[
                      AnimatedSize(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        alignment: Alignment.topCenter,
                        child: RepaintBoundary(
                          child: Experience(
                            key: sectionKeys[2],
                            isExpanded: _isExperienceExpanded,
                            onToggleExpand: () {
                              setState(() {
                                _isExperienceExpanded = !_isExperienceExpanded;
                              });
                            },
                          ),
                        ),
                      ),
                      RepaintBoundary(
                        child: Projects(
                          key: sectionKeys[3],
                        ),
                      ),
                      const RepaintBoundary(
                        child: Education(),
                      ),
                    ],
                    RepaintBoundary(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: _isAnilistVisible ? 20 : 0,
                        children: [
                          PinterestSection(
                            onEasterEggPressed: () {
                              setState(() {
                                _isAnilistVisible = !_isAnilistVisible;
                              });
                            },
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            alignment: Alignment.topCenter,
                            child:
                                _isAnilistVisible
                                    ? AnilistSection(
                                      onClosePressed: () {
                                        setState(() {
                                          _isAnilistVisible = false;
                                        });
                                      },
                                    )
                                    : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                    RepaintBoundary(
                      child: ContactMe(key: sectionKeys[4]),
                    ),
                    const RepaintBoundary(
                      child: Footer(),
                    ),
                  ],
                ),
              ),
            ),
            // Fixed Navbar
            Positioned(
              top: 20,
              left: padding,
              right: padding,
              child: RepaintBoundary(
                child: Navbar(
                  sectionKeys: sectionKeys,
                  scrollController: scrollController,
                  sections: [
                    "Home",
                    "About",
                    "Experience",
                    "Projects",
                    "Contact",
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
