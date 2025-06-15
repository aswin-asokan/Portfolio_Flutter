import 'package:flutter/material.dart';
import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/widgets/about_section.dart';
import 'package:portfolio/features/app_page/widgets/app_page_header.dart';
import 'package:portfolio/features/app_page/widgets/app_ss_list.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final List<String> features = [
    "Browse and search all packages from pub.dev",
    "View key package details: version, release date, SDK/Flutter compatibility, platforms",
    "Quick access to pub.dev, documentation, and GitHub links",
    "Clearly shows if a package is discontinued",
    "Multi-language support (English, Spanish, Hindi, Malayalam)",
    "Light and dark theme support (follows system preferences)",
  ];
  final List<String> upcoming = [
    "Mark packages as favorites and get notified on updates",
    "In-app chatbot support for suggestions and help",
  ];
  final List<InfoModel> infoItems = [
    InfoModel(title: "Version", content: "1.0.0"),
    InfoModel(title: "Updated on", content: "17th May 2025"),
    InfoModel(title: "Product type", content: "Developer Tools"),
    InfoModel(title: "Size", content: "48.7 MB"),
    InfoModel(
      title: "Languages",
      content: "English, Spanish, Hindi, Malayalam",
    ),
    InfoModel(
      title: "Links",
      content: "https://github.com/aswin-asokan/peekpub",
      isLink: true,
      linkText: "Github",
    ),
  ];
  final List<InfoModel> infoProject = [
    InfoModel(title: "Tech Stack", content: "Flutter | Pub.dev API"),
    InfoModel(title: "Tools & Services", content: "Git | Github"),
    InfoModel(title: "Skills", content: "Git, Github"),
  ];
  double padding = 60;
  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isDesktopLarge(context)) {
      padding = 60;
    } else if (Responsive.isTablet(context)) {
      padding = 40;
    } else {
      padding = 10;
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xfff66d16),
            Color(0xfff26818),
            Color(0xffef6318),
            Color(0xffe85819),
            Color(0xffe9541b),
            Color(0xffe44d1c),
            Color(0xffe2461c),
            Color(0xffe5461e),
            Color(0xffe5461e),
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(
                    Responsive.isMobile(context) ||
                            Responsive.isSmallTablet(context)
                        ? padding + 20
                        : padding - 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: context.colorScheme.surface,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      AppPageHeader(
                        title: "PeekPub",
                        subTitle: "Browse, Search, and Explore.",
                        buttonText: "Github",
                        link: "https://github.com/aswin-asokan/peekpub",
                        device: AppAvailability.android,
                        imgPath: "assets/files/projects/icons/PeekPub_logo.png",
                      ),
                      Divider(color: context.colorScheme.primary, thickness: 1),
                      SelectableText(
                        "Screenshots",
                        style: context.textTheme.titleMedium!.copyWith(
                          fontSize: 25,
                        ),
                      ),
                      AppSsList(),
                      Divider(color: context.colorScheme.primary, thickness: 1),
                      AboutSection(
                        title: "About this app",
                        about:
                            "Trelza PeekPub is a clean and lightweight pub.dev tracker app built to help developers browse, search, and explore Flutter/Dart packages effortlessly. Whether you're looking for the latest package versions, supported platforms, or official links (pub.dev, docs, GitHub), PeekPub helps you quickly find the perfect package for your project.",
                        subtitle1: "🚀 Features",
                        content1: features,
                        subtitle2: "🧩 Future Plans",
                        content2: upcoming,
                        infoItems: infoItems,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
