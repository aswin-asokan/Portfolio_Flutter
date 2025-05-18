import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class FooterIcon extends StatelessWidget {
  const FooterIcon({super.key, required this.path, required this.url});
  final String path;
  final String url;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        path,
        height: 25,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
