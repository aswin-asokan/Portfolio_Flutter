import 'iframe_platform_stub.dart'
    if (dart.library.js_util) 'iframe_platform_web.dart'
    if (dart.library.js) 'iframe_platform_web.dart';
import 'package:flutter/material.dart';

class IFrameWidget extends StatelessWidget {
  final String viewId;
  final String url;

  const IFrameWidget({
    super.key,
    required this.viewId,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return createIFrameWidget(viewId: viewId, url: url);
  }
}
