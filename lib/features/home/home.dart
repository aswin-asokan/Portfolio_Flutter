import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/about/screens/about_me.dart';
import 'package:portfolio/features/contact/screens/contact_me.dart';
import 'package:portfolio/features/experience/screens/experience.dart';
import 'package:portfolio/features/footer/screens/footer.dart';
import 'package:portfolio/features/hero/screens/hero_container.dart';
import 'package:portfolio/features/navbar/navbar.dart';
import 'package:portfolio/features/projects/screens/projects.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/toast.dart';
import 'package:portfolio/responsive/responsive.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<GlobalKey> sectionKeys = List.generate(5, (_) => GlobalKey());
  final ScrollController scrollController = ScrollController();
  final bool _isLoading = false;
  @override
  void initState() {
    super.initState();
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
      body:
          _isLoading
              ? Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: Colors.white,
                  size: 200,
                ),
              )
              : SelectionArea(
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
                            HeroSection(),
                            SizedBox(
                              height: AppConstants.spaceM,
                              key: sectionKeys[1],
                            ),
                            AboutMe(
                              onNavigate: scrollTo,
                              contactKey: sectionKeys[4],
                            ),
                            Text(
                              "Experience",
                              style: context.textTheme.bodyLarge,
                              key: sectionKeys[2],
                            ),
                            Experience(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Projects",
                                  style: context.textTheme.bodyLarge,
                                  key: sectionKeys[3],
                                ),
                                IconButton(
                                  onPressed: () {
                                    showToast(
                                      context,
                                      "Tap on the project card to view it's details\nIn case system navigation doesn't work please use back option in navigation bar",
                                    );
                                  },
                                  icon: Icon(
                                    Symbols.help_outline,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            Projects(),
                            Text(
                              "Contact Me",
                              style: context.textTheme.bodyLarge,
                              key: sectionKeys[4],
                            ),
                            ContactMe(),
                            Footer(),
                          ],
                        ),
                      ),
                    ),
                    // Fixed Navbar
                    Positioned(
                      top: 20,
                      left: padding,
                      right: padding,
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
                  ],
                ),
              ),
    );
  }
}
