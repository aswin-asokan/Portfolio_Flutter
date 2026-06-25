import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/projects/widgets/project_card.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/project_list/project_list.dart';
import 'package:portfolio/features/shared/widgets/keep_alive_wrapper.dart';
import 'package:portfolio/responsive/responsive.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheProjectImages();
    });
  }

  Future<void> _precacheProjectImages() async {
    for (final app in projects) {
      if (!mounted) return;
      precacheImage(CachedNetworkImageProvider(app.bannerPath), context).catchError((_) {});
      precacheImage(CachedNetworkImageProvider(app.iconPath), context).catchError((_) {});
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
