import 'package:flutter/material.dart';
import 'package:portfolio/features/footer/widgets/footer_icon.dart';
import 'package:portfolio/responsive/responsive.dart';

class FooterIcons extends StatelessWidget {
  const FooterIcons({super.key});

  final List<Map<String, String>> _socialIconsData = const [
    {
      "path": "assets/icons/github.svg",
      "url": "https://github.com/aswin-asokan",
      "label": "Github",
    },
    {
      "path": "assets/icons/linkedin.svg",
      "url": "https://www.linkedin.com/in/aswin-asokan/",
      "label": "LinkedIn",
    },
    {
      "path": "assets/icons/pinterest.svg",
      "url": "https://pin.it/416Oj6Tmc",
      "label": "Pinterest",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment:
          !isMobile ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        !isMobile
            ? Row(
              children:
                  _socialIconsData
                      .map(
                        (data) => Row(
                          children: [
                            FooterIcon(
                              path: data["path"]!,
                              url: data["url"]!,
                              label: data["label"]!,
                            ),
                          ],
                        ),
                      )
                      .toList(),
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  _socialIconsData
                      .map(
                        (data) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FooterIcon(
                              path: data["path"]!,
                              url: data["url"]!,
                              label: data["label"]!,
                            ),
                          ],
                        ),
                      )
                      .toList(),
            ),
        FooterIcon(
          path: "assets/icons/Buy_Me_a_Coffee_logo.svg",
          url: "https://buymeacoffee.com/aswin_asokan",
          label: "",
        ),
      ],
    );
  }
}
