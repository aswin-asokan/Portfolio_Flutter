import 'package:portfolio/features/app_page/models/info_model.dart';

class ProjectInfo {
  final List<InfoModel> items;

  ProjectInfo({
    required String techStack,
    required String tools,
    required String skills,
  }) : items = [
         InfoModel(title: "Tech Stack", content: techStack),
         InfoModel(title: "Tools & Services", content: tools),
         InfoModel(title: "Skills", content: skills),
       ];
}
