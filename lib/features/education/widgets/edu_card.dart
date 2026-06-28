import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
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
  bool _isIconHovered = false;

  void _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth <= 540;

    Widget buildImageWidget({required bool fullWidth}) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isIconHovered = true),
        onExit: (_) => setState(() => _isIconHovered = false),
        child: GestureDetector(
          onTap: _launchUrl,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutBack,
            transform:
                _isIconHovered
                    ? Matrix4.translationValues(0, -6, 0)
                    : Matrix4.identity(),
            child: AnimatedScale(
              scale: _isIconHovered ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              child: Container(
                width: fullWidth ? double.infinity : null,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    widget.icon,
                    height: fullWidth ? 140 : 120,
                    width: fullWidth ? double.infinity : null,
                    fit: fullWidth ? BoxFit.cover : BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: isSmallScreen ? 16 : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.colorScheme.surface,
        border: Border.all(color: AppColors.getBorder(context)),
      ),
      child: isSmallScreen
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
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
              spacing: 12,
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
                      Text(widget.institution, style: context.textTheme.bodySmall),
                      const SizedBox(height: 2),
                      Text(widget.year, style: context.textTheme.displaySmall),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
