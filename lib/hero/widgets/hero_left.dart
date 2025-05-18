import 'package:flutter/material.dart';
import 'package:portfolio/hero/widgets/dot_decoration.dart';
import 'package:portfolio/hero/widgets/hero_image.dart';

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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        spacing: 20,
        children: [
          SizedBox(width: 40),
          SizedBox(width: 450, height: 800, child: HeroImage()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotDecoration(spacing: 40, rowNum: 6, colNum: 6, size: 10),
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
      ),
    );
  }
}
