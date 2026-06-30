import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';

import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _launch(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $urlString');
    }
  }

  Widget _buildBuyMeACoffeeButton(BuildContext context) {
    return CustomButton.filled(
      label: "Buy me a coffee",
      onPress: () => _launch("https://buymeacoffee.com/aswin_asokan"),
      color: AppColors.coffeeBg,
      suffixIcon: Icon(SimpleIcons.buymeacoffee, color: AppColors.coffeeText),
    );
  }

  Widget _buildCopyrightBlock(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "© ${DateTime.now().year} Aswin",
          style: context.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("Just a bunch of widgets", style: context.textTheme.displaySmall),
        Text(
          "pretending to be a website.",
          style: context.textTheme.displaySmall,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          width: double.infinity,
          decoration: BoxDecoration(
            color:
                isDark
                    ? Colors.black26.withAlpha(50)
                    : Colors.white10.withAlpha(50),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.getBorder(context), width: 1.5),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double width = MediaQuery.sizeOf(context).width;

              if (width < 540) {
                // Mobile layout (same as current)
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    // Avatar + Text
                    Column(
                      spacing: 12,
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: ResizeImage(
                            AssetImage("assets/icons/char_icon.webp"),
                            width: 100,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 4,
                          children: [
                            Text(
                              "Thanks for making it this far!",
                              textAlign: TextAlign.center,
                              style: context.textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Best enjoyed on desktop. Mobile misses some fun stuff!",
                              textAlign: TextAlign.center,
                              style: context.textTheme.displaySmall?.copyWith(
                                color: AppColors.getDescriptionText(context),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: "Built with "),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              child: Icon(
                                Icons.favorite,
                                size: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const TextSpan(text: " Flutter"),
                        ],
                      ),
                      style: context.textTheme.displayMedium,
                    ),

                    // Buy me a coffee
                    _buildBuyMeACoffeeButton(context),

                    // Copyright
                    _buildCopyrightBlock(context, isMobile: true),
                  ],
                );
              } else if (width < 1280) {
                // Tablet layout (split into two columns)
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16,
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: ResizeImage(
                              AssetImage("assets/icons/char_icon.webp"),
                              width: 100,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Text(
                                "Thanks for making it this far!",
                                style: context.textTheme.displayMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Best enjoyed on desktop. Mobile misses some fun stuff!",
                                style: context.textTheme.displaySmall?.copyWith(
                                  color: AppColors.getDescriptionText(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    // Right column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 16,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(text: "Built with "),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const TextSpan(text: " Flutter"),
                              ],
                            ),
                            style: context.textTheme.displayMedium,
                          ),
                          _buildBuyMeACoffeeButton(context),
                          _buildCopyrightBlock(context, isMobile: false),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                // Desktop layout (single row, with Built with 💙 Flutter centered)
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Left side: Avatar + Text
                    Expanded(
                      child: Row(
                        spacing: 16,
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: ResizeImage(
                              AssetImage("assets/icons/char_icon.webp"),
                              width: 100,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              spacing: 4,
                              children: [
                                Text(
                                  "Thanks for making it this far!",
                                  style: context.textTheme.displayMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Best enjoyed on desktop. Mobile misses some fun stuff!",
                                  style: context.textTheme.displaySmall
                                      ?.copyWith(
                                        color: AppColors.getDescriptionText(
                                          context,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Center: Built with 💙 Flutter (mathematically centered via two equal expanded side elements)
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: "Built with "),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              child: Icon(
                                Icons.favorite,
                                size: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const TextSpan(text: " Flutter"),
                        ],
                      ),
                      style: context.textTheme.displayMedium,
                    ),

                    // Right side: Buy me a coffee + Copyright
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 16,
                        children: [
                          _buildBuyMeACoffeeButton(context),
                          _buildCopyrightBlock(context, isMobile: false),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
