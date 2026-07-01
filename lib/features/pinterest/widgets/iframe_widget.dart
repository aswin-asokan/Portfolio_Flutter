import 'dart:async';
import 'iframe_platform_stub.dart'
    if (dart.library.js_util) 'iframe_platform_web.dart'
    if (dart.library.js) 'iframe_platform_web.dart';
import 'package:flutter/material.dart';

class IFrameWidget extends StatefulWidget {
  final String viewId;
  final String url;
  final Widget? placeholder;
  final bool preventInteraction;

  const IFrameWidget({
    super.key,
    required this.viewId,
    required this.url,
    this.placeholder,
    this.preventInteraction = true,
  });

  @override
  State<IFrameWidget> createState() => _IFrameWidgetState();
}

class _IFrameWidgetState extends State<IFrameWidget> {
  bool _showIframe = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Delay the rendering of the IFrame to avoid blocking the main thread
    // during initial rendering or fast scrolling.
    _timer = Timer(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          _showIframe = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.placeholder != null) widget.placeholder!,
        if (_showIframe)
          Positioned.fill(
            child: createIFrameWidget(
              viewId: widget.viewId,
              url: widget.url,
              placeholder: widget.placeholder,
              preventInteraction: widget.preventInteraction,
            ),
          ),
      ],
    );
  }
}


