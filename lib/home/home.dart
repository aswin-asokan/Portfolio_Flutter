import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/about/screens/about_me.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(
      context,
      listen: false,
    ); // get the provider, listen false is necessary cause is in a function

    setState(() {
      isDarkmode = !isDarkmode;
      icon =
          isDarkmode ? Symbols.light_mode_rounded : Symbols.dark_mode_rounded;
    }); // change the variable

    isDarkmode // call the functions
        ? themeProvider.setDarkmode()
        : themeProvider.setLightMode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Navbar(onPress: switchtheme, icon: icon, isDark: isDarkmode),
                HeroSection(),
                AboutMe(),
                Text("Experience", style: context.textTheme.bodyLarge),
                Experience(),
                Footer(isDark: isDarkmode),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
