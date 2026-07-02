import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:portfolio/features/shared/widgets/shimmer_placeholder.dart';
import 'package:portfolio/responsive/responsive.dart';

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
            child: kIsWeb
                ? Image.network(
                    widget.imagePath,
                    height: widget.height,
                    fit: BoxFit.fitHeight,
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) return child;
                      return frame != null ? child : const ShimmerPlaceholder();
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade300,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.broken_image,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : CachedNetworkImage(
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
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) || Responsive.isSmallTablet(context) ? 16 : 80,
            vertical: Responsive.isMobile(context) || Responsive.isSmallTablet(context) ? 20 : 40,
          ),
          child: InteractiveViewer(
            key: ValueKey(_currentIndex),
            maxScale: 4.0,
            clipBehavior: Clip.none,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: kIsWeb
                  ? Image.network(
                      widget.images[_currentIndex],
                      fit: BoxFit.contain,
                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) return child;
                        return frame != null
                            ? child
                            : const Center(
                                child: CircularProgressIndicator(color: Colors.white),
                              );
                      },
                    )
                  : CachedNetworkImage(
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
          child: _LightboxButton(
            icon: Icons.close,
            onPressed: () => Navigator.of(context).pop(),
            iconSize: 24,
          ),
        ),
        // Prev button on the left
        if (_currentIndex > 0)
          Positioned(
            left: 20,
            child: _LightboxButton(
              icon: Icons.chevron_left,
              onPressed: _prev,
              iconSize: 32,
            ),
          ),
        // Next button on the right
        if (_currentIndex < widget.images.length - 1)
          Positioned(
            right: 20,
            child: _LightboxButton(
              icon: Icons.chevron_right,
              onPressed: _next,
              iconSize: 32,
            ),
          ),
      ],
    );
  }
}

class _LightboxButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;

  const _LightboxButton({
    required this.icon,
    required this.onPressed,
    this.iconSize = 28,
  });

  @override
  State<_LightboxButton> createState() => _LightboxButtonState();
}

class _LightboxButtonState extends State<_LightboxButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.black.withValues(alpha: 0.8)
              : Colors.black.withValues(alpha: 0.5),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: widget.onPressed,
            icon: Icon(
              widget.icon,
              color: Colors.white,
            ),
            iconSize: widget.iconSize,
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(8),
          ),
        ),
      ),
    );
  }
}
