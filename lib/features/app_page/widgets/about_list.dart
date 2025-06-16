import 'package:flutter/material.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';

class AboutList extends StatelessWidget {
  const AboutList({super.key, required this.title, required this.content});
  final String title;
  final List content;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        SelectableText(
          title,
          style: context.textTheme.titleMedium!.copyWith(fontSize: 20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              content.map((feature) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SelectableText(
                    "•\t$feature",
                    style: context.textTheme.displaySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
