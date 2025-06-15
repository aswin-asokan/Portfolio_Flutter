import 'package:flutter/material.dart';
import 'package:portfolio/features/app_page/widgets/info_item.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.infoItems});
  final List infoItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          "Information",
          style: context.textTheme.titleMedium!.copyWith(fontSize: 18),
        ),
        Wrap(
          spacing: 30,
          runSpacing: 15,
          children:
              infoItems.map((item) {
                return InfoItem(
                  title: item.title,
                  content: item.content,
                  isLink: item.isLink,
                  linkText: item.linkText ?? "",
                );
              }).toList(),
        ),
      ],
    );
  }
}
