import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/projects/widgets/project_card.dart';
import 'package:portfolio/features/projects/widgets/project_list.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/responsive/responsive.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final ScrollController _scrollController = ScrollController();
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
    return Stack(
      alignment: Alignment.center,
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              spacing: 25,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(projects.length, (index) {
                return ProjectCard(
                  title: projects[index]["title"],
                  bannerPath: projects[index]["bannerPath"],
                  caption: projects[index]["caption"],
                  categories: projects[index]["categories"],
                  iconPath: projects[index]["iconPath"],
                  gitLink: projects[index]["gitLink"],
                );
              }),
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
