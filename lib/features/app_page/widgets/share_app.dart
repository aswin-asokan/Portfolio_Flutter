import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void shareLink(String platform, String link) async {
  final encodedLink = Uri.encodeComponent(link);

  String url;

  switch (platform) {
    case 'whatsapp':
      url =
          'https://wa.me/?text=${Uri.encodeComponent("Hey, check out this super cool project I just stumbled upon!: $link")}';
      break;
    case 'facebook':
      url = 'https://www.facebook.com/sharer/sharer.php?u=$encodedLink';
      break;
    case 'twitter':
      url =
          'https://twitter.com/intent/tweet?text=Check%20this%20out&url=$encodedLink';
      break;
    case 'email':
      url =
          'mailto:?subject=Hey check out this super cool project I just stumbled upon!&body=$encodedLink';
      break;
    case 'copy':
      Clipboard.setData(ClipboardData(text: link));
      return;
    default:
      return;
  }

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
