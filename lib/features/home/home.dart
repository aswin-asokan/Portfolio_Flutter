import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/about/screens/about_me.dart';
import 'package:portfolio/features/contact/screens/contact_me.dart';
import 'package:portfolio/core/themes/theme_switch.dart';
import 'package:portfolio/features/experience/screens/experience.dart';
import 'package:portfolio/features/footer/screens/footer.dart';
import 'package:portfolio/features/navbar/navbar.dart';
import 'package:portfolio/features/hero/screens/hero_container.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDarkmode = false;
  IconData icon = Symbols.dark_mode_rounded;

  void switchtheme() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    setState(() {
      isDarkmode = !isDarkmode;
      icon =
          isDarkmode ? Symbols.light_mode_rounded : Symbols.dark_mode_rounded;
    });
    isDarkmode ? themeProvider.setDarkmode() : themeProvider.setLightMode();
  }

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey footerKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  double padding = 60;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
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
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: 20,
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80), // Space for navbar
                    //HeroSection(key: heroKey),
                    AboutMe(
                      key: aboutKey,
                      onNavigate: scrollTo,
                      contactKey: contactKey,
                    ),
                    Text(
                      "Experience",
                      style: context.textTheme.bodyLarge,
                      key: experienceKey,
                    ),
                    //Experience(),
                    Text(
                      "Contact Me",
                      style: context.textTheme.bodyLarge,
                      key: contactKey,
                    ),
                    ContactMe(),
                    Footer(isDark: isDarkmode),
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
                onPress: switchtheme,
                icon: icon,
                isDark: isDarkmode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
