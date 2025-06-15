import 'package:flutter/material.dart';
import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/about_section.dart';
import 'package:portfolio/features/app_page/widgets/app_page_header.dart';
import 'package:portfolio/features/app_page/widgets/app_ss_list.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';
import 'package:portfolio/features/navbar/navbar.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class AppPage extends StatefulWidget {
  const AppPage({
    super.key,
    required this.title,
    required this.iconPath,
    required this.gitLink,
    required this.subtitle,
    required this.releaseLink,
    required this.type,
    required this.devices,
    required this.screenshots,
    required this.aboutApp,
    required this.features,
    required this.futurePlan,
    required this.appInfo,
    required this.aboutProject,
    required this.challeges,
    required this.outcomes,
    required this.projectInfo,
  });
  final String title;
  final String subtitle;
  final String iconPath;
  final List<String> screenshots;
  final String gitLink;
  final String type;
  final String releaseLink;
  final String aboutApp;
  final List<String> features;
  final List<String> futurePlan;
  final String aboutProject;
  final List<String> challeges;
  final List<String> outcomes;
  final AppAvailability devices;
  final AppInfo appInfo;
  final ProjectInfo projectInfo;
  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final List<GlobalKey> sectionKeys = List.generate(5, (_) => GlobalKey());
  final ScrollController scrollController = ScrollController();
  late final List<InfoModel> appInfoItems, pjtinfoItems;
  double padding = 60;

  @override
  void initState() {
    super.initState();
    appInfoItems = widget.appInfo.items;
    pjtinfoItems = widget.projectInfo.items;
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

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
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:
                          Responsive.isMobile(context) ||
                                  Responsive.isSmallTablet(context)
                              ? 85
                              : 70,
                      key: sectionKeys[0],
                    ),
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
                            title: widget.title,
                            subTitle: widget.subtitle,
                            buttonText: widget.type,
                            gitLink: widget.gitLink,
                            releaseLink: widget.releaseLink,
                            device: widget.devices,
                            imgPath: widget.iconPath,
                          ),
                          Divider(
                            color: context.colorScheme.primary,
                            thickness: 1,
                          ),
                          SelectableText(
                            key: sectionKeys[1],
                            "Screenshots",
                            style: context.textTheme.titleMedium!.copyWith(
                              fontSize: 25,
                            ),
                          ),
                          AppSsList(images: widget.screenshots),
                          Divider(
                            color: context.colorScheme.primary,
                            thickness: 1,
                          ),
                          AboutSection(
                            key: sectionKeys[2],
                            title: "About this app",
                            about: widget.aboutApp,
                            subtitle1: "🛠️ Features",
                            content1: widget.features,
                            subtitle2: "🚀 Future Plans",
                            content2: widget.futurePlan,
                            infoItems: appInfoItems,
                          ),
                          Divider(
                            color: context.colorScheme.primary,
                            thickness: 1,
                          ),
                          AboutSection(
                            key: sectionKeys[3],
                            title: "About this project",
                            about: widget.aboutProject,
                            subtitle1: "⚙️ Challenges faced",
                            content1: widget.challeges,
                            subtitle2: "🎯 Learnings or outcomes",
                            content2: widget.outcomes,
                            infoItems: pjtinfoItems,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: padding,
              right: padding,
              child: Navbar(
                sectionKeys: sectionKeys,
                scrollController: scrollController,
                isBackEnabled: true,
                sections: [
                  "Header",
                  "Screenshots",
                  "About App",
                  "About Project",
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
