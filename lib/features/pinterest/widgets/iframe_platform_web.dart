import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

final Set<String> _registeredViews = {};

Widget createIFrameWidget({
  required String viewId,
  required String url,
  Widget? placeholder,
  bool preventInteraction = false,
}) {
  if (!_registeredViews.contains(viewId)) {
    ui_web.platformViewRegistry.registerViewFactory(viewId, (int id) {
      final div =
          web.HTMLDivElement()
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.overflow = 'hidden'
            ..style.setProperty('-webkit-overflow-scrolling', 'touch');

      if (preventInteraction) {
        div.style.setProperty('pointer-events', 'none');
      }

      final iframe =
          web.HTMLIFrameElement()
            ..src = url
            ..setAttribute('scrolling', 'no')
            ..style.border = 'none'
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.overflow = 'hidden';

      div.appendChild(iframe);
      return div;
    });
    _registeredViews.add(viewId);
  }
  return HtmlElementView(viewType: viewId);
}
