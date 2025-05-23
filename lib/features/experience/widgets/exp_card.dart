import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/custom_container.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

class ExpCard extends StatelessWidget {
  const ExpCard({
    super.key,
    required this.icon,
    required this.org,
    required this.role,
    required this.period,
    required this.summary,
    this.url,
    this.hasLink = false,
    this.hasFile = false,
    this.file,
    this.filename,
  });
  final IconData icon;
  final String role;
  final String org;
  final String period;
  final List<String> summary;
  final String? url;
  final bool hasLink;
  final bool hasFile;
  final String? file;
  final String? filename;
  String get formattedText => summary.map((item) => "•\t\t$item").join("\n");
  void downloadAssetFile(String assetPath, String downloadFileName) {
    web.HTMLAnchorElement()
      ..href = assetPath
      ..download = downloadFileName
      ..target = '_blank'
      ..click();
  }

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
    return CustomContainer(
      child: SizedBox(
        height:
            Responsive.isDesktop(context) || Responsive.isDesktopLarge(context)
                ? 220
                : 300,
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 12,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: context.colorScheme.primary,
                    size: 50,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Text(
                              role,
                              style: context.textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (hasLink || hasFile)
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  hasLink
                                      ? _launch(url!)
                                      : downloadAssetFile(file!, filename!);
                                },
                                child: Icon(
                                  Symbols.insert_link,
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SelectableText(org, style: context.textTheme.bodySmall),
                      const SizedBox(height: 2),
                      SelectableText(
                        period,
                        style: context.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            SelectableText(formattedText, style: context.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
