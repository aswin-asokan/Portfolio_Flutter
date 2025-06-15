class InfoModel {
  final String title;
  final String content;
  final bool isLink;
  final String? linkText;

  InfoModel({
    required this.title,
    required this.content,
    this.isLink = false,
    this.linkText,
  });
}
