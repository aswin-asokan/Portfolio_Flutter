import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/widgets/dot_decoration.dart';
import 'package:portfolio/features/hero/widgets/hero_image.dart';
import 'package:portfolio/responsive/responsive.dart';

class HeroLeft extends StatelessWidget {
  const HeroLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xfff97116),
            Color(0xfff96f1a),
            Color(0xfff56226),
            Color(0xfff04e38),
            Color(0xffee4442),
          ],
        ),
        borderRadius:
            Responsive.isMobile(context) || Responsive.isSmallTablet(context)
                ? BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
                : BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
      ),
      child:
          !Responsive.isMobile(context)
              ? Row(
                spacing: 20,
                children: [
                  SizedBox(width: 40),
                  SizedBox(
                    width:
                        Responsive.isTablet(context)
                            ? 500
                            : Responsive.isSmallTablet(context)
                            ? MediaQuery.sizeOf(context).width * 0.88
                            : 450,
                    height: Responsive.isMobile(context) ? 500 : 800,
                    child: HeroImage(),
                  ),
                  if (Responsive.isDesktopLarge(context))
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DotDecoration(
                          spacing: 40,
                          rowNum: 6,
                          colNum: 6,
                          size: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                DotDecoration(
                                  spacing: 10,
                                  rowNum: 6,
                                  colNum: 3,
                                  size: 20,
                                ),
                              ],
                            ),
                            SizedBox(height: 80),
                          ],
                        ),
                      ],
                    ),
                ],
              )
              : SizedBox(
                width: double.infinity,
                height: 450,
                child: HeroImage(),
              ),
    );
  }
}
