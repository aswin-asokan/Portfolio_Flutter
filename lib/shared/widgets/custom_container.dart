import 'package:flutter/material.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.color,
  });
  final Widget child;
  final EdgeInsets padding;
  final Color? color;
  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform:
            _isHovering
                ? Matrix4.translationValues(0, -5, 0)
                : Matrix4.translationValues(0, 0, 0),
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.color ?? context.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: _isHovering ? 15 : 5,
              offset: Offset(0, _isHovering ? 8 : 4),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
