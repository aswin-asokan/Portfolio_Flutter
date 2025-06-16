import 'package:flutter/material.dart';
import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/widgets/about_list.dart';
import 'package:portfolio/features/app_page/widgets/info_widget.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.title,
    required this.about,
    required this.subtitle1,
    required this.content1,
    required this.subtitle2,
    required this.content2,
    required this.infoItems,
  });
  final String title;
  final String about;
  final String subtitle1;
  final String subtitle2;
  final List content1;
  final List content2;
  final List<InfoModel> infoItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          title,
          style: context.textTheme.titleMedium!.copyWith(fontSize: 25),
        ),
        Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  SelectableText(
                    about,
                    style: context.textTheme.displaySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  AboutList(title: subtitle1, content: content1),
                  AboutList(title: subtitle2, content: content2),
                ],
              ),
            ),
            if (!Responsive.isMobile(context))
              Expanded(flex: 4, child: InfoWidget(infoItems: infoItems)),
          ],
        ),
        if (Responsive.isMobile(context)) InfoWidget(infoItems: infoItems),
      ],
    );
  }
}
