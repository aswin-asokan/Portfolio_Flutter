import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/models/icon_models.dart';
import 'package:portfolio/features/app_page/models/project_enums.dart';

class ProjectInfo {
  final List<InfoModel> items;

  ProjectInfo({
    required List<TechStack> techStack,
    required List<Tools> tools,
    required List<Skills> skills,
  }) : items = [
          InfoModel(
            title: "Tech Stack",
            iconLabels: techStack
                .map((t) => ProjectInfoIconModel(
                      label: t.label,
                      icon: t.icon,
                      color: t.color,
                    ))
                .toList(),
          ),
          InfoModel(
            title: "Tools & Services",
            iconLabels: tools
                .map((t) => ToolsIconModel(
                      label: t.label,
                      icon: t.icon,
                      color: t.color,
                    ))
                .toList(),
          ),
          InfoModel(
            title: "Skills",
            iconLabels: skills
                .map((s) => SkillsIconModel(
                      label: s.label,
                      icon: s.icon,
                      color: s.color,
                    ))
                .toList(),
          ),
        ];
}
