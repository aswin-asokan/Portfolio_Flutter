import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/features/app_page/widgets/app_screenshot_card.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:portfolio/features/shared/widgets/keep_alive_wrapper.dart';
import 'package:portfolio/features/shared/widgets/shimmer_placeholder.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class AppSsList extends StatefulWidget {
  const AppSsList({super.key, required this.images});
  final List<String> images;
  @override
  State<AppSsList> createState() => _AppSsListState();
}

class _AppSsListState extends State<AppSsList> {
  final ScrollController _scrollController = ScrollController();
  bool _isImagesLoading = true;
  int _currentIndex = 0;
  late List<double> _aspectRatios;

  @override
  void initState() {
    super.initState();
    // Default aspect ratio set to portrait (9:16)
    _aspectRatios = List.filled(widget.images.length, 9.0 / 16.0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheImages();
    });
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!mounted) return;
    if (!_scrollController.hasClients) return;
    final double currentOffset = _scrollController.offset;
    final double maxScroll = _scrollController.position.maxScrollExtent;

    int closestIndex = 0;

    if (maxScroll > 0 && currentOffset >= maxScroll - 15) {
      closestIndex = widget.images.length - 1;
    } else {
      // Find the index whose starting offset is closest to the current scroll offset
      double minDiff = double.infinity;
      for (int i = 0; i < widget.images.length; i++) {
        final double itemOffset = _getScrollOffset(i);
        final double diff = (currentOffset - itemOffset).abs();
        if (diff < minDiff) {
          minDiff = diff;
          closestIndex = i;
        }
      }
    }

    if (closestIndex != _currentIndex &&
        closestIndex >= 0 &&
        closestIndex < widget.images.length) {
      setState(() {
        _currentIndex = closestIndex;
      });
    }
  }

  double _getItemWidth(int index) {
    final double cardHeight = Responsive.isMobile(context) ? 350.0 : 450.0;
    final double aspect = _aspectRatios[index];
    final double imageWidth = cardHeight * aspect;
    return imageWidth + 15.0; // width + right padding (15.0)
  }

  double _getScrollOffset(int index) {
    double offset = 0.0;
    for (int i = 0; i < index; i++) {
      offset += _getItemWidth(i);
    }
    return offset;
  }

  Future<void> _precacheImages() async {
    int resolvedCount = 0;
    for (int i = 0; i < widget.images.length; i++) {
      final url = widget.images[i];
      try {
        final ImageProvider provider =
            kIsWeb
                ? NetworkImage(url)
                : CachedNetworkImageProvider(url, maxWidth: 800);
        if (!kIsWeb) {
          await precacheImage(provider, context);
        }
        final ImageStream stream = provider.resolve(const ImageConfiguration());
        stream.addListener(
          ImageStreamListener(
            (ImageInfo info, bool _) {
              resolvedCount++;
              if (mounted) {
                setState(() {
                  _aspectRatios[i] = info.image.width / info.image.height;
                  // Transition to content view once at least the first few are resolved, or all resolved
                  if (resolvedCount >= widget.images.length ||
                      resolvedCount >= 2) {
                    _isImagesLoading = false;
                  }
                });
              }
            },
            onError: (dynamic exception, StackTrace? stackTrace) {
              resolvedCount++;
              if (resolvedCount >= widget.images.length && mounted) {
                setState(() {
                  _isImagesLoading = false;
                });
              }
            },
          ),
        );
      } catch (e) {
        resolvedCount++;
      }
    }
    // Fallback timer just in case image loading hangs
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _isImagesLoading) {
        setState(() {
          _isImagesLoading = false;
        });
      }
    });
  }

  void _scrollToIndex(int index) {
    if (index < 0 || index >= widget.images.length) return;
    _scrollController.animateTo(
      _getScrollOffset(index),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildIndicatorDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.images.length, (index) {
        final bool isActive = index == _currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 8 : 6,
          height: isActive ? 8 : 6,
          decoration: BoxDecoration(
            color:
                isActive
                    ? context.colorScheme.primary
                    : context.colorScheme.primary.withAlpha(80),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double cardHeight = Responsive.isMobile(context) ? 350 : 450;
    final double defaultItemWidth = Responsive.isMobile(context) ? 200 : 250;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.getLavenderBg(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.getBorder(context), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          CornerHighlight(
            corner: SparkleCorner.topLeft,
            lengthFactor: 0.6,
            strokeWidth: 3,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? AppColors.white
                    : AppColors.black,
            child: Text(
              "Screenshots",
              style: context.textTheme.titleMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Stack(
            children: [
              SizedBox(
                height: cardHeight,
                child: RepaintBoundary(
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      if (_isImagesLoading) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: ShimmerPlaceholder(
                            width: defaultItemWidth,
                            height: cardHeight,
                          ),
                        );
                      }
                      return KeepAliveWrapper(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: AppScreenshotCard(
                            imagePath: widget.images[index],
                            height: cardHeight,
                            images: widget.images,
                            index: index,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _ScrollButton(
                    icon: Icons.chevron_left,
                    onPressed: () => _scrollToIndex(_currentIndex - 1),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _ScrollButton(
                    icon: Icons.chevron_right,
                    onPressed: () => _scrollToIndex(_currentIndex + 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildIndicatorDots(),
        ],
      ),
    );
  }
}

class _ScrollButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ScrollButton({required this.icon, required this.onPressed});

  @override
  State<_ScrollButton> createState() => _ScrollButtonState();
}

class _ScrollButtonState extends State<_ScrollButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color:
              _isHovered
                  ? context.colorScheme.primaryContainer
                  : context.colorScheme.surface.withValues(alpha: 0.8),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            widget.icon,
            color:
                _isHovered
                    ? context.colorScheme.onPrimaryContainer
                    : context.colorScheme.onSurface,
          ),
          iconSize: 20,
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(8),
        ),
      ),
    );
  }
}
