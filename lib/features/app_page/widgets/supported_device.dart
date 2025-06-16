import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';

enum AppAvailability {
  android(icon: Symbols.phone_android, text: "Available for Android"),
  ios(icon: Symbols.phone_android, text: "Available for iOS"),
  mac(icon: Symbols.laptop_chromebook, text: "Available for macOS"),
  linux(icon: Symbols.laptop_chromebook, text: "Available for Linux"),
  androidWeb(icon: Symbols.devices, text: "Available for Android and Web"),
  androidDesktop(
    icon: Symbols.devices,
    text: "Available for Android and Desktop platform",
  ),
  website(icon: Symbols.web, text: "Available as Website"),
  all(icon: Symbols.devices, text: "Available for All Devices"),
  codeOnly(
    icon: Symbols.deployed_code,
    text: "Source Code Available on GitHub",
  );

  const AppAvailability({required this.icon, required this.text});

  final IconData icon;
  final String text;
}

class SupportedDevice extends StatelessWidget {
  const SupportedDevice({super.key, required this.device});
  final AppAvailability device;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Icon(device.icon, color: context.colorScheme.onSurface, size: 18),
        SelectableText(
          device.text,
          style: context.textTheme.displaySmall!.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
