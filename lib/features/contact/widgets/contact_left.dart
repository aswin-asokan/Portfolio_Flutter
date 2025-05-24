import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/contact/widgets/contact_links.dart';
import 'package:portfolio/features/contact/widgets/map.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class ContactLeft extends StatelessWidget {
  const ContactLeft({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          "Get in Touch",
          style: context.textTheme.titleMedium!.copyWith(fontSize: 25),
        ),
        SelectableText(
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
        if (!Responsive.isSmallTablet(context) && !Responsive.isTablet(context))
          SizedBox(height: 10),
        if (!Responsive.isSmallTablet(context) && !Responsive.isTablet(context))
          MapWidget(),
      ],
    );
  }
}
