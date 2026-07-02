import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/models/project_enums.dart';

class AppInfoIconModel extends IconLabelModel {
  final AppInfoLink platform;

  AppInfoIconModel({
    required this.platform,
    required String link,
  }) : super(
         label: platform.label,
         icon: platform.icon,
         color: platform.color,
         link: link,
       );
}

class ProjectInfoIconModel extends IconLabelModel {
  const ProjectInfoIconModel({
    super.icon,
    required super.label,
    super.link,
    super.color,
  });
}

class ToolsIconModel extends IconLabelModel {
  const ToolsIconModel({
    super.icon,
    required super.label,
    super.link,
    super.color,
  });
}

class SkillsIconModel extends IconLabelModel {
  const SkillsIconModel({
    super.icon,
    required super.label,
    super.link,
    super.color,
  });
}
