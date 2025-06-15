import 'package:flutter/material.dart';
import 'package:portfolio/features/app_page/widgets/ShareButtonsRow.dart';
import 'package:portfolio/features/app_page/widgets/app_icon.dart';
import 'package:portfolio/features/app_page/widgets/clipboard_field.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';

Future<void> dialogBuilder(
  BuildContext context,
  String title,
  String path,
  String link,
) {
  TextEditingController copyController = TextEditingController(text: link);
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: context.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.all(20),
        content: SizedBox(
          width: 400,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Row(
                spacing: 15,
                children: [
                  AppIcon(path: path, radius: 8, height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Text(title, style: context.textTheme.titleSmall),
                      Text(
                        "Share this project",
                        style: context.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ],
              ),
              ShareButtonsRow(link: 'https://github.com/aswin-asokan/GradGate'),
              ClipboardField(controller: copyController),
            ],
          ),
        ),
      );
    },
  );
}
