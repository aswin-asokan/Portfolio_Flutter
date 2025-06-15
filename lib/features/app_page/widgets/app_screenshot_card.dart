import 'package:flutter/material.dart';

class AppScreenshotCard extends StatelessWidget {
  const AppScreenshotCard({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(imagePath, fit: BoxFit.cover), // FIXED
    );
  }
}
