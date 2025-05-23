import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/features/shared/widgets/custom_container.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.title,
    required this.bannerPath,
    required this.caption,
    required this.categories,
    required this.iconPath,
    required this.gitLink,
  });
  final String title;
  final String bannerPath;
  final String caption;
  final String iconPath;
  final String categories;
  final String gitLink;
  void _launch(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double cardWidth = Responsive.isMobile(context) ? 350 : 550;
    final double cardHeight = Responsive.isMobile(context) ? 280 : 400;
    final double padding = Responsive.isMobile(context) ? 18 : 24;
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: CustomContainer(
        padding: EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              // Image filling the entire stack
              Positioned.fill(
                child: Image.asset(bannerPath, fit: BoxFit.cover),
              ),
              Positioned(
                top: cardHeight * 0.5,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.black54,
                        Colors.black45,
                        Colors.black38,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: padding,
                    bottom: padding,
                    right: padding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: Responsive.isMobile(context) ? 10 : 25,
                    children: [
                      Text(
                        caption,
                        maxLines: 2,
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: Responsive.isMobile(context) ? 18 : 27,
                          height: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 15,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  Responsive.isMobile(context) ? 8 : 15,
                                ),
                                child: Image.asset(
                                  iconPath,
                                  height:
                                      Responsive.isMobile(context) ? 30 : 45,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 2,
                                children: [
                                  Text(
                                    title,
                                    style: GoogleFonts.outfit(
                                      fontSize:
                                          Responsive.isMobile(context)
                                              ? 15
                                              : 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    categories,
                                    style: GoogleFonts.outfit(
                                      fontSize:
                                          Responsive.isMobile(context)
                                              ? 12
                                              : 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              _launch(gitLink);
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/github.svg",
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              height: Responsive.isMobile(context) ? 20 : 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
