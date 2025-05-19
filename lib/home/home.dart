import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/about/screens/about_me.dart';
import 'package:portfolio/contact/screens/contact_me.dart';
import 'package:portfolio/core/themes/theme_switch.dart';
import 'package:portfolio/experience/screens/experience.dart';
import 'package:portfolio/footer/screens/footer.dart';
import 'package:portfolio/hero/navbar/navbar.dart';
import 'package:portfolio/hero/screens/hero_container.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';
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

  @override
  Widget build(BuildContext context) {
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
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 20,
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80), // Space for navbar
                    HeroSection(key: heroKey),
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
                    Experience(),
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
              left: 60,
              right: 60,
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
