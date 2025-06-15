import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/app_page/widgets/share_builder.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

enum AppButtonEnum {
  download(icon: Symbols.download, text: "Download"),
  website(icon: SimpleIcons.googlechrome, text: "Website"),
  github(icon: SimpleIcons.github, text: "GitHub");

  const AppButtonEnum({required this.icon, required this.text});

  final IconData icon;
  final String text;

  static AppButtonEnum? fromText(String text) {
    return AppButtonEnum.values.firstWhere((e) => e.text.toLowerCase() == text);
  }
}

void _launch(String urlString) async {
  final url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw Exception('Could not launch $urlString');
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.link,
    required this.path,
    required this.title,
  });
  final String text;
  final String link;
  final String path;
  final String title;
  @override
  Widget build(BuildContext context) {
    final appButton = AppButtonEnum.fromText(text.toLowerCase());
    return Row(
      spacing: 8,
      children: [
        SizedBox(
          height: 40,
          width: 140,
          child: ElevatedButton(
            onPressed: () {
              _launch(link);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                context.colorScheme.primary,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
            ),
            child: Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  (appButton?.icon) ?? Symbols.download,
                  color: context.colorScheme.surfaceContainerHigh,
                ),
                Text(
                  (appButton?.text) ?? "Download",
                  style: context.textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            dialogBuilder(context, title, path, link);
          },
          child: Row(
            spacing: 8,
            children: [
              Icon(Symbols.share, size: 18, color: context.colorScheme.primary),
              Text(
                "Share",
                style: context.textTheme.displayMedium!.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
