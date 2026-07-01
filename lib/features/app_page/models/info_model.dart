import 'package:flutter/material.dart';

class IconLabelModel {
  final IconData? icon;
  final String label;
  final String? link;

  const IconLabelModel({
    this.icon,
    required this.label,
    this.link,
  });
}

class InfoModel {
  final String title;
  final String? content;
  final bool isLink;
  final String? linkText;
  final List<IconLabelModel>? iconLabels;

  InfoModel({
    required this.title,
    this.content,
    this.isLink = false,
    this.linkText,
    this.iconLabels,
  });
}
