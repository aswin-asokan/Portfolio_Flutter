import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactLinks extends StatelessWidget {
  const ContactLinks({
    super.key,
    required this.label,
    required this.icon,
    required this.link,
    this.isMail = false,
  });
  final String link;
  final String label;
  final IconData icon;
  final bool isMail;
  void _launchMailClient(String targetEmail) async {
    String mailUrl = 'mailto:$targetEmail';
    try {
      await launchUrlString(mailUrl);
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: targetEmail));
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: context.colorScheme.primary),
        TextButton(
          onPressed: () {
            isMail ? _launchMailClient(link) : _launch(link);
          },
          child: SelectableText(label, style: context.textTheme.bodySmall),
        ),
      ],
    );
  }
}
