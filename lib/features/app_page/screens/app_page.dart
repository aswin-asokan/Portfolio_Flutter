import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/features/app_page/models/app_button_type.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  final AppButtonType type;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheIcon();
    });
  }

  Future<void> _precacheIcon() async {
    if (kIsWeb) return;
    try {
      if (mounted && widget.iconPath.isNotEmpty) {
        await precacheImage(
          CachedNetworkImageProvider(widget.iconPath, maxWidth: kIsWeb ? null : 300),
          context,
          onError: (exception, stackTrace) {},
        ).catchError((_) {});
      }
    } catch (_) {}
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
                    RepaintBoundary(
                      child: AppPageHeader(
                        title: widget.title,
                        subTitle: widget.subtitle,
                        buttonType: widget.type,
                        gitLink: widget.gitLink,
                        releaseLink: widget.releaseLink,
                        device: widget.devices,
                        imgPath: widget.iconPath,
                      ),
                    ),
                    RepaintBoundary(
                      child: AppSsList(
                        key: sectionKeys[1],
                        images: widget.screenshots,
                      ),
                    ),
                    RepaintBoundary(
                      child: AboutAppSection(
                        key: sectionKeys[2],
                        about: widget.aboutApp,
                        features: widget.features,
                        futurePlans: widget.futurePlan,
                        infoItems: appInfoItems,
                      ),
                    ),
                    RepaintBoundary(
                      child: AboutProjectSection(
                        key: sectionKeys[3],
                        about: widget.aboutProject,
                        challenges: widget.challeges,
                        outcomes: widget.outcomes,
                        infoItems: pjtinfoItems,
                      ),
                    ),
                    const RepaintBoundary(
                      child: Footer(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: padding,
              right: padding,
              child: RepaintBoundary(
                child: Navbar(
                  sectionKeys: sectionKeys,
                  scrollController: scrollController,
                  sections: [
                    "Header",
                    "Screenshots",
                    "About App",
                    "About Project",
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
