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
    required this.buttonType,
    required this.githubUrl,
    required this.liveUrl,
    required this.shareLink,
    required this.path,
    required this.title,
  });

  // Link management params
  final AppButtonType buttonType;
  final String githubUrl;
  final String liveUrl;
  final String shareLink;

  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CustomButton.outline(
          label: buttonType.text,
          onPress: () {
            _launch(liveUrl.isEmpty ? githubUrl : liveUrl);
          },
          prefixIcon: Icon(buttonType.icon),
        ),
        TextButton(
          onPressed: () {
            dialogBuilder(context, title, path, shareLink);
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
