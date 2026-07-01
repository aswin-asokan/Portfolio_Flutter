import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/app_page/widgets/share_builder.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/features/app_page/models/app_button_type.dart';

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
    required this.type,
    required this.gitLink,
    required this.releaseLink,
    required this.path,
    required this.title,
  });
  final AppButtonType type;
  final String gitLink;
  final String releaseLink;
  final String path;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CustomButton.outline(
          label: type.text,
          onPress: () {
            _launch(releaseLink.isEmpty ? gitLink : releaseLink);
          },
          prefixIcon: Icon(type.icon),
        ),
        TextButton(
          onPressed: () {
            dialogBuilder(context, title, path, gitLink);
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
