import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/app_page/widgets/share_app.dart';
import 'package:simple_icons/simple_icons.dart';

class ShareItem {
  final String platform;
  final IconData icon;
  final Color color;

  const ShareItem({
    required this.platform,
    required this.icon,
    required this.color,
  });
}

class ShareButtonsRow extends StatelessWidget {
  final String link;

  const ShareButtonsRow({super.key, required this.link});

  final List<ShareItem> shareItems = const [
    ShareItem(
      platform: 'whatsapp',
      icon: SimpleIcons.whatsapp,
      color: SimpleIconColors.whatsapp,
    ),
    ShareItem(
      platform: 'twitter',
      icon: SimpleIcons.x,
      color: SimpleIconColors.x,
    ),
    ShareItem(
      platform: 'facebook',
      icon: SimpleIcons.facebook,
      color: SimpleIconColors.facebook,
    ),
    ShareItem(
      platform: 'email',
      icon: Symbols.mail_outline,
      color: Color(0xff888888),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          shareItems.map((item) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: IconButton(
                    iconSize: 25,
                    icon: Icon(item.icon, color: Colors.white),
                    onPressed: () => shareLink(item.platform, link),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
