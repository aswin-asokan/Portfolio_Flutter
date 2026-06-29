import 'package:flutter/material.dart';
import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/about_app_section.dart';
import 'package:portfolio/features/app_page/widgets/about_project_section.dart';
import 'package:portfolio/features/app_page/widgets/app_page_header.dart';
import 'package:portfolio/features/app_page/widgets/app_ss_list.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';
import 'package:portfolio/features/navbar/navbar.dart';
import 'package:portfolio/features/footer/screens/footer.dart';
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
    padding = Responsive.padding(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SelectionArea(
        child: Stack(
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
                  spacing: 15,
                  children: [
                    SizedBox(
                      height:
                          Responsive.isMobile(context) ||
                                  Responsive.isSmallTablet(context)
                              ? 85
                              : 70,
                      key: sectionKeys[0],
                    ),
                    AppPageHeader(
                      title: widget.title,
                      subTitle: widget.subtitle,
                      buttonText: widget.type,
                      gitLink: widget.gitLink,
                      releaseLink: widget.releaseLink,
                      device: widget.devices,
                      imgPath: widget.iconPath,
                    ),
                    AppSsList(
                      key: sectionKeys[1],
                      images: widget.screenshots,
                    ),
                    AboutAppSection(
                      key: sectionKeys[2],
                      about: widget.aboutApp,
                      features: widget.features,
                      futurePlans: widget.futurePlan,
                      infoItems: appInfoItems,
                    ),
                    AboutProjectSection(
                      key: sectionKeys[3],
                      about: widget.aboutProject,
                      challenges: widget.challeges,
                      outcomes: widget.outcomes,
                      infoItems: pjtinfoItems,
                    ),
                    const Footer(),
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
