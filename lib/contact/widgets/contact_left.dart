import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/contact/widgets/contact_links.dart';
import 'package:portfolio/contact/widgets/map.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';

class ContactLeft extends StatelessWidget {
  const ContactLeft({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Get in Touch",
          style: context.textTheme.titleMedium!.copyWith(fontSize: 25),
        ),
        Text(
          "I'm always open to discussing new projects, creative ideas or opportunities to be part of your visions.",
          style: context.textTheme.bodySmall,
        ),
        SizedBox(height: 5),
        ContactLinks(
          label: "aswin_asokan@outlook.com",
          icon: Symbols.alternate_email,
          link: "aswin_asokan@outlook.com",
          isMail: true,
        ),
        SizedBox(height: 10),
        MapWidget(),
      ],
    );
  }
}
