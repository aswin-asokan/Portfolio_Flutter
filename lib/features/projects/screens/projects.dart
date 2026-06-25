import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/projects/widgets/project_card.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/project_list/project_list.dart';
import 'package:portfolio/features/shared/widgets/keep_alive_wrapper.dart';
import 'package:portfolio/features/shared/widgets/shimmer_placeholder.dart';
import 'package:portfolio/responsive/responsive.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final ScrollController _scrollController = ScrollController();
  bool _isImagesLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheProjectImages();
    });
  }

  Future<void> _precacheProjectImages() async {
    try {
      final futures = <Future<void>>[];
      for (final app in projects) {
        futures.add(precacheImage(CachedNetworkImageProvider(app.bannerPath), context));
        futures.add(precacheImage(CachedNetworkImageProvider(app.iconPath), context));
      }
      await Future.wait(futures);
    } catch (e) {
      // Fail-safe
    } finally {
      if (mounted) {
        setState(() {
          _isImagesLoading = false;
        });
      }
    }
  }

  void _scrollRight(double offset) {
    _scrollController.animateTo(
      _scrollController.offset + offset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollLeft(double offset) {
    _scrollController.animateTo(
      _scrollController.offset - offset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double cardHeight = Responsive.isMobile(context) ? 280 : 400;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SizedBox(
            height: cardHeight + 10, // Added slight height padding to avoid clipping shadows
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final double cardWidth = Responsive.isMobile(context) ? 350 : 550;
                if (_isImagesLoading) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: ShimmerPlaceholder(
                      width: cardWidth,
                      height: cardHeight,
                    ),
                  );
                }
                final app = projects[index];
                return KeepAliveWrapper(
                  child: RepaintBoundary(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            context.push('/app/${app.id}');
                          },
                          child: ProjectCard(
                            title: app.title,
                            bannerPath: app.bannerPath,
                            caption: app.caption,
                            categories: app.techStack,
                            iconPath: app.iconPath,
                            gitLink: app.gitLink,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: CircleAvatar(
            radius: Responsive.isMobile(context) ? 20 : 23,
            backgroundColor: context.colorScheme.surface,
            child: IconButton(
              onPressed:
                  () => _scrollLeft(Responsive.isMobile(context) ? 375 : 575),
              icon: Icon(
                Symbols.keyboard_arrow_left,
                size: Responsive.isMobile(context) ? 15 : 20,
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: CircleAvatar(
            radius: Responsive.isMobile(context) ? 20 : 23,
            backgroundColor: context.colorScheme.surface,
            child: IconButton(
              onPressed:
                  () => _scrollRight(Responsive.isMobile(context) ? 375 : 575),
              icon: Icon(
                Symbols.keyboard_arrow_right,
                size: Responsive.isMobile(context) ? 15 : 20,
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
