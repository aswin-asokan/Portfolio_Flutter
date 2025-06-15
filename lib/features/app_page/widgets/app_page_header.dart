import 'package:flutter/material.dart';
import 'package:portfolio/features/app_page/widgets/app_button.dart';
import 'package:portfolio/features/app_page/widgets/app_icon.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class AppPageHeader extends StatelessWidget {
  const AppPageHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.link,
    required this.device,
    required this.imgPath,
  });
  final String title;
  final String subTitle;
  final String buttonText;
  final String link;
  final AppAvailability device;
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 15,
      children: [
        if (!Responsive.isMobile(context))
          AppIcon(path: imgPath, radius: 15, height: 130),
        Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 16,
              children: [
                if (Responsive.isMobile(context))
                  AppIcon(path: imgPath, radius: 8, height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      title,
                      style: context.textTheme.titleMedium!.copyWith(
                        fontSize: 30,
                      ),
                    ),
                    SelectableText(
                      subTitle,
                      style: context.textTheme.displaySmall!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AppButton(
              text: buttonText,
              link: link,
              path: imgPath,
              title: title,
            ),
            SupportedDevice(device: AppAvailability.androidLinux),
          ],
        ),
      ],
    );
  }
}
