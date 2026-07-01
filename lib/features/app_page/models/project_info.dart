import 'package:portfolio/features/app_page/models/info_model.dart';

class ProjectInfo {
  final List<InfoModel> items;

  ProjectInfo({
    required List<IconLabelModel> techStack,
    required List<IconLabelModel> tools,
    required List<IconLabelModel> skills,
  }) : items = [
         InfoModel(title: "Tech Stack", iconLabels: techStack),
         InfoModel(title: "Tools & Services", iconLabels: tools),
         InfoModel(title: "Skills", iconLabels: skills),
       ];
}
