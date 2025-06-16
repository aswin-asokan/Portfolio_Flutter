import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_symbols_icons/symbols.dart';
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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          showToast(
            context,
            "The pictures are hosted on Github and may take some time to load.",
          );
        }
      });
    });
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
    if (Responsive.isDesktop(context) || Responsive.isDesktopLarge(context)) {
      padding = 60;
    } else if (Responsive.isTablet(context)) {
      padding = 40;
    } else {
      padding = 10;
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xfff66d16),
            Color(0xfff26818),
            Color(0xffef6318),
            Color(0xffe85819),
            Color(0xffe9541b),
            Color(0xffe44d1c),
            Color(0xffe2461c),
            Color(0xffe5461e),
            Color(0xffe5461e),
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body:
            _isLoading
                ? Center(
                  // Display a loading indicator while _isLoading is true
                  child: Lottie.asset("assets/icons/loading.json", height: 250),
                )
                : Stack(
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
                              height: 70,
                              key: sectionKeys[0],
                            ), // Space for navbar
                            HeroSection(),
                            AboutMe(
                              onNavigate: scrollTo,
                              contactKey: sectionKeys[4],
                              key: sectionKeys[1],
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
                                      "Tap on the project card to view it's details.",
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
