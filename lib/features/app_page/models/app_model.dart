import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';

class AppModel {
  final String id;
  final String title;
  final String caption;
  final String subtitle;
  final String bannerPath;
  final String iconPath;
  final List<String> screenshots;
  final String techStack;
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
  AppModel({
    required this.id,
    required this.title,
    required this.caption,
    required this.techStack,
    required this.bannerPath,
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
}
