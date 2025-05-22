import 'package:flutter/material.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterIcon extends StatelessWidget {
  const FooterIcon({
    super.key,
    required this.path,
    required this.url,
    required this.label,
  });
  final String path;
  final String url;
  final String label;
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
    final SvgPicture pic = SvgPicture.asset(
      path,
      height: 25,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );

    return !Responsive.isMobile(context)
        ? IconButton(
          onPressed: () {
            _launch(url);
          },
          icon: pic,
        )
        : TextButton(
          onPressed: () {
            _launch(url);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              pic,
              Text(label, style: context.textTheme.displayMedium),
            ],
          ),
        );
  }
}
