import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  static const String _email = "aswin_asokan@outlook.com";
  static const String _pinterestUrl = "https://pin.it/416Oj6Tmc";
  static const String _linkedinUrl =
      "https://www.linkedin.com/in/aswin-asokan/";
  static const String _mapUrl = "https://maps.app.goo.gl/tSvhm3HRWSR3cbjz6";
  static const String _gitHub = "https://github.com/aswin-asokan";

  @override
  Widget build(BuildContext context) {
    final bool isDesktop =
        Responsive.isDesktop(context) || Responsive.isDesktopLarge(context);
    final bool isMobile = Responsive.isMobile(context);

    if (isDesktop) {
      return SizedBox(
        height: 220,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: const [
            Expanded(
              flex: 2,
              child: _ConnectMapCard(layout: _ConnectMapLayout.desktop),
            ),
            Expanded(child: _SocialsCard(forceVertical: true)),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 20,
      children: [
        _ConnectMapCard(
          layout:
              isMobile ? _ConnectMapLayout.mobile : _ConnectMapLayout.tablet,
        ),
        const _SocialsCard(forceVertical: false),
      ],
    );
  }

  static Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  static Future<void> _launchMailClient() async {
    try {
      await launchUrlString("mailto:$_email");
    } catch (_) {
      // Intentionally quiet: this section should never interrupt scrolling.
    }
  }
}

enum _ConnectMapLayout { desktop, tablet, mobile }

class _ConnectMapCard extends StatelessWidget {
  const _ConnectMapCard({required this.layout});

  final _ConnectMapLayout layout;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double leftPadding =
        screenWidth < AppConstants.pinterestResponsiveTitleBreakpoint
            ? AppConstants.pinterestPaddingLeftSmall
            : AppConstants.pinterestPaddingLeftLarge;
    final EdgeInsets contentPadding = EdgeInsets.fromLTRB(
      leftPadding,
      26,
      26,
      26,
    );

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.getBorder(context)),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      child: switch (layout) {
        _ConnectMapLayout.mobile => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _MapPreview(
              height: 205,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            Padding(padding: contentPadding, child: const _ConnectContent()),
          ],
        ),
        _ => SizedBox(
          height: 220,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: contentPadding,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: _ConnectContent(),
                  ),
                ),
              ),
              Expanded(
                flex: layout == _ConnectMapLayout.desktop ? 5 : 4,
                child: const _MapPreview(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      },
    );
  }
}

class _ConnectContent extends StatelessWidget {
  const _ConnectContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Let's Connect!",
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            CornerHighlight(
              corner: SparkleCorner.rightCenter,
              color: AppColors.primaryPurpleDark.withValues(alpha: 0.7),
              child: SizedBox(width: AppConstants.spaceS),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Found a cool project? Count me in.",
          style: context.textTheme.bodySmall?.copyWith(height: 1.45),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: 260,
          child: CustomButton.filled(
            label: "Send me a message",
            color: context.colorScheme.primary,
            suffixIcon: const Icon(Symbols.mail, fill: 1, size: 20),
            onPress: ContactMe._launchMailClient,
          ),
        ),
      ],
    );
  }
}

class _MapPreview extends StatelessWidget {
  const _MapPreview({this.height, required this.borderRadius});

  final double? height;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ContactMe._launchUrl(ContactMe._mapUrl),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(
          "assets/images/maps/map.webp",
          height: height,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _SocialsCard extends StatelessWidget {
  const _SocialsCard({required this.forceVertical});

  final bool forceVertical;

  @override
  Widget build(BuildContext context) {
    final links = [
      _SocialLink(
        icon: const Icon(SimpleIcons.maildotru),
        label: ContactMe._email,
        iconColor: AppColors.brandMail,
        onTap: ContactMe._launchMailClient,
      ),
      _SocialLink(
        icon: const Icon(SimpleIcons.pinterest),
        label: "pin.it/416Oj6Tmc",
        iconColor: AppColors.brandpinterest,
        onTap: () => ContactMe._launchUrl(ContactMe._pinterestUrl),
      ),
      _SocialLink(
        icon: const Icon(SimpleIcons.github),
        label: "github.com/aswin-asokan",
        iconColor: AppColors.brandGithub,
        onTap: () => ContactMe._launchUrl(ContactMe._gitHub),
      ),
      _SocialLink(
        icon: const _LinkedInMark(),
        label: "linkedin.com/in/aswin-asokan",
        onTap: () => ContactMe._launchUrl(ContactMe._linkedinUrl),
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.getBorder(context)),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool useRow = !forceVertical && constraints.maxWidth >= 760;
          if (useRow) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 18,
              children:
                  links
                      .map((link) => Flexible(child: _SocialLinkTile(link)))
                      .toList(),
            );
          }

          if (forceVertical) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 18,
              children: links.map(_SocialLinkTile.new).toList(),
            );
          }

          return Wrap(
            spacing: 18,
            runSpacing: 18,
            children: links.map(_SocialLinkTile.new).toList(),
          );
        },
      ),
    );
  }
}

class _SocialLinkTile extends StatelessWidget {
  const _SocialLinkTile(this.link);

  final _SocialLink link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: link.onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: 22,
              child: IconTheme(
                data: IconThemeData(
                  size: 22,
                  color: link.iconColor ?? context.colorScheme.primary,
                ),
                child: link.icon,
              ),
            ),
            const SizedBox(width: 14),
            Flexible(
              child: Text(
                link.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialLink {
  const _SocialLink({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
}

class _LinkedInMark extends StatelessWidget {
  const _LinkedInMark();

  @override
  Widget build(BuildContext context) {
    return Text(
      "in",
      style: context.textTheme.bodyMedium?.copyWith(
        color: AppColors.brandlinkedIn,
        fontWeight: FontWeight.w900,
        height: 1,
      ),
    );
  }
}
