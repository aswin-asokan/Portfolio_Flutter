import 'package:flutter/material.dart';

class DotDecoration extends StatelessWidget {
  const DotDecoration({
    super.key,
    required this.spacing,
    required this.rowNum,
    required this.colNum,
    required this.size,
  });
  final double spacing;
  final int rowNum;
  final int colNum;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          spacing: spacing,
          children: List.generate(rowNum, (outerIndex) {
            return Column(
              spacing: 1,
              children: List.generate(colNum, (innerIndex) {
                return Container(
                  height: size,
                  width: size,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(200),
                  ),
                );
              }),
            );
          }),
        ),
      ],
    );
  }
}
