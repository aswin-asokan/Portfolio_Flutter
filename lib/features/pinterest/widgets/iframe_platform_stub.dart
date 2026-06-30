import 'package:flutter/material.dart';

Widget createIFrameWidget({
  required String viewId,
  required String url,
  Widget? placeholder,
  bool preventInteraction = false,
}) {
  return placeholder ?? const SizedBox();
}

