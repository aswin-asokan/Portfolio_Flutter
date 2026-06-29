import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class EduCard extends StatefulWidget {
  const EduCard({
    super.key,
    required this.title,
    required this.year,
    required this.institution,
    required this.icon,
    required this.url,
  });

  final String title;
  final String year;
  final String institution;
  final String icon;
  final String url;

  @override
  State<EduCard> createState() => _EduCardState();
}

class _EduCardState extends State<EduCard> {

  void _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth <= AppConstants.educationCardMobileBreakpoint;

    Widget buildImageWidget({required bool fullWidth}) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _launchUrl,
          child: Container(
            width: fullWidth ? double.infinity : null,
            padding: const EdgeInsets.all(AppConstants.spaceS),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppConstants.radiusS)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.spaceXS),
              child: Image.asset(
                widget.icon,
                height: fullWidth
                    ? AppConstants.educationImageHeightMobile
                    : AppConstants.educationImageHeightDesktop,
                width: fullWidth ? double.infinity : null,
                fit: fullWidth ? BoxFit.cover : BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spaceM,
        vertical: isSmallScreen ? AppConstants.spaceM : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        color: context.colorScheme.surface,
        border: Border.all(color: AppColors.getBorder(context)),
      ),
      child:
          isSmallScreen
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: AppConstants.spaceS,
                children: [
                  Text(
                    widget.title,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.institution, style: context.textTheme.bodySmall),
                  Text(widget.year, style: context.textTheme.displaySmall),
                  buildImageWidget(fullWidth: true),
                ],
              )
              : Row(
                mainAxisSize: MainAxisSize.min,
                spacing: AppConstants.radiusM,
                children: [
                  buildImageWidget(fullWidth: false),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.institution,
                          style: context.textTheme.bodySmall,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.year,
                          style: context.textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
