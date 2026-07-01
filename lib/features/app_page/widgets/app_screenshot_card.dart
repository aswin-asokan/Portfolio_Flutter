import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:portfolio/features/shared/widgets/shimmer_placeholder.dart';

class AppScreenshotCard extends StatefulWidget {
  const AppScreenshotCard({
    super.key,
    required this.imagePath,
    required this.height,
    required this.images,
    required this.index,
  });

  final String imagePath;
  final double height;
  final List<String> images;
  final int index;

  @override
  State<AppScreenshotCard> createState() => _AppScreenshotCardState();
}

class _AppScreenshotCardState extends State<AppScreenshotCard> {
  bool _isOpening = false;

  void _showLightbox(BuildContext context) async {
    if (_isOpening) return;
    setState(() {
      _isOpening = true;
    });
    try {
      await showDialog(
        context: context,
        barrierColor: Colors.black.withAlpha(230),
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: _LightboxDialog(
              images: widget.images,
              initialIndex: widget.index,
            ),
          );
        },
      );
    } finally {
      if (mounted) {
        setState(() {
          _isOpening = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _showLightbox(context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: widget.imagePath,
              memCacheWidth: kIsWeb ? null : 800,
              height: widget.height,
              fit: BoxFit.fitHeight,
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
          ),
        ),
      ),
    );
  }
}

class _LightboxDialog extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const _LightboxDialog({
    required this.images,
    required this.initialIndex,
  });

  @override
  State<_LightboxDialog> createState() => _LightboxDialogState();
}

class _LightboxDialogState extends State<_LightboxDialog> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _prev() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _next() {
    if (_currentIndex < widget.images.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Backdrop tap to close
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        // The image itself
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
          child: InteractiveViewer(
            key: ValueKey(_currentIndex),
            maxScale: 4.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: widget.images[_currentIndex],
                memCacheWidth: kIsWeb ? null : 1200,
                fit: BoxFit.contain,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        // Close button at top-right
        Positioned(
          top: 20,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 36),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        // Prev button on the left
        if (_currentIndex > 0)
          Positioned(
            left: 20,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.white, size: 48),
                onPressed: _prev,
              ),
            ),
          ),
        // Next button on the right
        if (_currentIndex < widget.images.length - 1)
          Positioned(
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.chevron_right, color: Colors.white, size: 48),
                onPressed: _next,
              ),
            ),
          ),
      ],
    );
  }
}
