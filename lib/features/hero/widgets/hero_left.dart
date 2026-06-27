import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/extension/theme_extension.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:portfolio/responsive/responsive.dart';

class HeroLeft extends StatelessWidget {
  const HeroLeft({super.key});

  @override
  Widget build(BuildContext context) {
    final double baseFontSize =
        Responsive.isDesktopLarge(context)
            ? 80
            : Responsive.isDesktop(context)
            ? 70
            : Responsive.isTablet(context)
            ? 55
            : 45;

    final double nameFontSize = baseFontSize + 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hi, I'm",
              style: GoogleFonts.comicRelief(
                fontSize: baseFontSize,
                height: 1.1,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (Responsive.isMobile(context) ||
                Responsive.isSmallTablet(context))
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Aswin ",
                        style: TextStyle(color: context.colorScheme.primary),
                      ),
                      TextSpan(
                        text: "Asokan",
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : const Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  style: GoogleFonts.comicRelief(
                    fontSize: nameFontSize,
                    height: 1.1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            else ...[
              Text(
                "Aswin",
                style: GoogleFonts.comicRelief(
                  fontSize: nameFontSize,
                  color: context.colorScheme.primary,
                  height: 1.1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Asokan",
                style: GoogleFonts.comicRelief(
                  fontSize: baseFontSize,
                  height: 1.1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: AppConstants.spaceXL),
        Container(
          padding: const EdgeInsets.all(AppConstants.spaceM),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.getBorder(context)),
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppConstants.spaceS,
            children: [
              Icon(
                Symbols.keyboard_arrow_right,
                size: AppConstants.iconSizeM,
                color: AppColors.darkGreen,
              ),
              Flexible(
                child: Text(
                  "Just a developer building neat, useful things with Flutter.",
                  style: context.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppConstants.spaceXL),
        if (Responsive.isMobile(context))
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppConstants.spaceM,
            children: [
              CustomButton.filled(
                label: "View My Work",
                onPress: () {},
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Theme.of(context).colorScheme.primary
                        : AppColors.darkButton,
                suffixIcon: const Icon(
                  Symbols.arrow_downward,
                  size: AppConstants.iconSizeS,
                ),
              ),
              CustomButton.text(
                label: "Download CV",
                onPress: () {},
                textColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? AppColors.lightButton
                        : AppColors.darkButton,
                suffixIcon: const Icon(
                  Symbols.download,
                  size: AppConstants.iconSizeS,
                ),
              ),
            ],
          )
        else
          Row(
            spacing: AppConstants.spaceM,
            children: [
              CustomButton.filled(
                label: "View My Work",
                onPress: () {},
                color: Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).colorScheme.primary
                    : AppColors.darkButton,
                suffixIcon: const Icon(
                  Symbols.arrow_downward,
                  size: AppConstants.iconSizeS,
                ),
              ),
              CustomButton.text(
                label: "Download CV",
                onPress: () {},
                textColor: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.lightButton
                    : AppColors.darkButton,
                suffixIcon: const Icon(
                  Symbols.download,
                  size: AppConstants.iconSizeS,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
