import 'package:portfolio/features/app_page/models/info_model.dart';

class AppInfo {
  final List<InfoModel> items;

  AppInfo({
    required String version,
    required String updatedOn,
    required String productType,
    required String size,
    required String languages,
    required String link,
    String linkText = "GitHub",
  }) : items = [
         InfoModel(title: "Version", content: version),
         InfoModel(title: "Updated on", content: updatedOn),
         InfoModel(title: "Product type", content: productType),
         InfoModel(title: "Size", content: size),
         InfoModel(title: "Languages", content: languages),
         InfoModel(
           title: "Links",
           content: link,
           isLink: true,
           linkText: linkText,
         ),
       ];
}
