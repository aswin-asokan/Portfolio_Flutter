import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:portfolio/features/app_page/widgets/app_screenshot_card.dart';
import 'package:portfolio/features/shared/widgets/keep_alive_wrapper.dart';
import 'package:portfolio/features/shared/widgets/shimmer_placeholder.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheImages();
    });
  }

  Future<void> _precacheImages() async {
    if (kIsWeb) {
      if (mounted) {
        setState(() {
          _isImagesLoading = false;
        });
      }
      return;
    }
    try {
      final futures = widget.images.map((url) {
        return precacheImage(CachedNetworkImageProvider(url), context);
      }).toList();
      // Wait for all screenshots to preload/cache
      await Future.wait(futures);
    } catch (e) {
      // Fail-safe: transition to images even if some fail
    } finally {
      if (mounted) {
        setState(() {
          _isImagesLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double cardHeight = Responsive.isMobile(context) ? 350 : 450;
    return Column(
      children: [
        Scrollbar(
          controller: _scrollController,
          thumbVisibility:
              Responsive.isDesktop(context) ||
                      Responsive.isDesktopLarge(context)
                  ? true
                  : false,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 18),
            child: SizedBox(
              height: cardHeight,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  if (_isImagesLoading) {
                    final double placeholderWidth = Responsive.isMobile(context) ? 200 : 250;
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: ShimmerPlaceholder(
                        width: placeholderWidth,
                        height: cardHeight,
                      ),
                    );
                  }
                  return KeepAliveWrapper(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: AppScreenshotCard(imagePath: widget.images[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
