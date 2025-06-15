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
    required this.gitLink,
    required this.releaseLink,
    required this.device,
    required this.imgPath,
  });
  final String title;
  final String subTitle;
  final String buttonText;
  final String gitLink;
  final String releaseLink;
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
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth:
                        Responsive.isMobile(context) ||
                                Responsive.isSmallTablet(context)
                            ? MediaQuery.sizeOf(context).width - 150
                            : double.infinity,
                  ),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleMedium!.copyWith(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          subTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.displaySmall!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            AppButton(
              text: buttonText,
              gitLink: gitLink,
              releaseLink: releaseLink,
              path: imgPath,
              title: title,
            ),
            SupportedDevice(device: device),
          ],
        ),
      ],
    );
  }
}
