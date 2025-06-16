import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.title,
    required this.content,
    this.isLink = false,
    this.linkText = "",
  });
  final String title;
  final String content;
  final bool isLink;
  final String linkText;
  void _launch(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isSmallTablet(context) ? 100 : 150,
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            title,
            style: context.textTheme.headlineSmall!.copyWith(fontSize: 18),
          ),
          if (!isLink)
            SelectableText(
              content,
              style: context.textTheme.bodySmall!.copyWith(fontSize: 15),
            ),
          if (isLink)
            MouseRegion(
              cursor: SystemMouseCursors.click,

              child: GestureDetector(
                onTap: () {
                  _launch(content);
                },
                child: Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Symbols.insert_link,
                      size: 13,
                      color: context.colorScheme.primary,
                    ),
                    Text(
                      linkText,
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
