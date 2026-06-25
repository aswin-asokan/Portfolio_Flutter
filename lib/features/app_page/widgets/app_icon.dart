import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:portfolio/features/shared/widgets/shimmer_placeholder.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.path,
    required this.radius,
    required this.height,
  });
  final String path;
  final double radius;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: path,
        height: height,
        width: height,
        fit: BoxFit.cover,
        memCacheHeight: 150,
        fadeInDuration: const Duration(milliseconds: 1200),
        fadeOutDuration: const Duration(milliseconds: 800),
        placeholder: (context, url) => ShimmerPlaceholder(
          width: height,
          height: height,
          borderRadius: radius,
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey.shade300,
          width: height,
          height: height,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image),
        ),
      ),
    );
  }
}
