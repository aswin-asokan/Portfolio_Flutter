import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:portfolio/features/shared/widgets/shimmer_placeholder.dart';

class AppScreenshotCard extends StatelessWidget {
  const AppScreenshotCard({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 1500),
        fadeOutDuration: const Duration(milliseconds: 1000),
        placeholder: (context, url) => const ShimmerPlaceholder(),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey.shade300,
          alignment: Alignment.center,
          child: const Icon(
            Icons.broken_image,
            size: 40,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
