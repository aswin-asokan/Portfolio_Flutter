import 'package:flutter/material.dart';
import 'package:portfolio/features/app_page/widgets/app_screenshot_card.dart';
import 'package:portfolio/responsive/responsive.dart';

class AppSsList extends StatefulWidget {
  const AppSsList({super.key, required this.images});
  final List<String> images;
  @override
  State<AppSsList> createState() => _AppSsListState();
}

class _AppSsListState extends State<AppSsList> {
  final ScrollController _scrollController = ScrollController();

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
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 18),
              child: SizedBox(
                height: cardHeight,
                child: Row(
                  children: List.generate(widget.images.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: AppScreenshotCard(imagePath: widget.images[index]),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
