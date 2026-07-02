import 'package:portfolio/features/app_page/models/info_model.dart';
import 'package:portfolio/features/app_page/models/icon_models.dart';

class AppInfo {
  final List<InfoModel> items;

  AppInfo({
    required String version,
    required String updatedOn,
    required String productType,
    required String size,
    required String languages,
    List<AppInfoIconModel>? links,
  }) : items = [
         InfoModel(title: "Version", content: version),
         InfoModel(title: "Updated on", content: updatedOn),
         InfoModel(title: "Product type", content: productType),
         InfoModel(title: "Size", content: size),
         InfoModel(title: "Languages", content: languages),
         if (links != null && links.isNotEmpty)
           InfoModel(
             title: "Links",
             isLink: true,
             iconLabels: links,
           ),
       ];
}
