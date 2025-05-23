import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/custom_container.dart';
import 'package:portfolio/responsive/responsive.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? "assets/images/logo/dark_logo.png"
                  : "assets/images/logo/light_logo.png",
              height: 30,
            ),

            Row(
              spacing: 20,
              children: [
                if (Responsive.isTablet(context) ||
                    Responsive.isDesktop(context) ||
                    Responsive.isDesktopLarge(context))
                  Row(
                    spacing: 10,
                    children: [
                      Text("Home", style: context.textTheme.labelMedium),
                      Text("Projects", style: context.textTheme.labelSmall),
                      Text("Contact", style: context.textTheme.labelSmall),
                    ],
                  ),
                if (Responsive.isMobile(context) ||
                    Responsive.isSmallTablet(context))
                  IconButton(onPressed: () {}, icon: Icon(Symbols.menu)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
