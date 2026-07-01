import 'package:portfolio/features/app_page/models/app_info.dart';
import 'package:portfolio/features/app_page/models/project_info.dart';
import 'package:portfolio/features/app_page/widgets/supported_device.dart';
import 'package:portfolio/features/app_page/models/app_button_type.dart';

enum ProjectType {
  flutter("Flutter"),
  web("Web"),
  tools("Tools"),
  aiMl("AI / ML"),
  other("Other");

  final String label;
  const ProjectType(this.label);
}

class AppModel {
  final String id;
  final String title;
  final String caption;
  final String subtitle;
  final String homeSummary;
  final String _bannerPath;
  final String _iconPath;
  final List<String> _screenshots;
  final List<String> techStack;
  final String mainTech;
  final ProjectType projectType;
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

  AppModel({
    required this.id,
    required this.title,
    required this.caption,
    required this.techStack,
    required this.mainTech,
    required this.projectType,
    required String bannerPath,
    required String iconPath,
    required this.gitLink,
    required this.subtitle,
    required this.homeSummary,
    required this.releaseLink,
    required this.type,
    required this.devices,
    required List<String> screenshots,
    required this.aboutApp,
    required this.features,
    required this.futurePlan,
    required this.appInfo,
    required this.aboutProject,
    required this.challeges,
    required this.outcomes,
    required this.projectInfo,
  })  : _bannerPath = bannerPath,
        _iconPath = iconPath,
        _screenshots = screenshots;

  String get bannerPath => _resolvePath(_bannerPath);
  String get iconPath => _resolvePath(_iconPath);
  List<String> get screenshots => _screenshots.map(_resolvePath).toList();

  static String _resolvePath(String path) {
    if (path.startsWith('http')) return path;
    const String baseUrl = "https://raw.githubusercontent.com/aswin-asokan/Portfolio_Flutter/dev";
    final cleanPath = path.startsWith('/') ? path.substring(1) : path;
    return "$baseUrl/$cleanPath";
  }
}
