import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:portfolio/features/shared/widgets/striped_loading_bar.dart';
import 'package:portfolio/features/shared/widgets/theme_switch_indicator.dart';

class ThemeTransitionOverlay extends StatefulWidget {
  final Widget child;
  final bool isSwitching;

  const ThemeTransitionOverlay({
    super.key,
    required this.child,
    required this.isSwitching,
  });

  @override
  State<ThemeTransitionOverlay> createState() => _ThemeTransitionOverlayState();
}

class _ThemeTransitionOverlayState extends State<ThemeTransitionOverlay>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _progressController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _progressAnimation;
  bool _visible = false;

  /// true when the user triggered a switch while in dark mode → going to light.
  bool _isDarkToLight = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeOutCubic),
    );

    if (widget.isSwitching) {
      _visible = true;
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant ThemeTransitionOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSwitching != oldWidget.isSwitching) {
      if (widget.isSwitching) {
        final theme = Theme.of(context);

        // Determine direction: if current brightness is dark we're going to
        // light, otherwise we're going to dark.
        _isDarkToLight = theme.brightness == Brightness.dark;

        setState(() {
          _visible = true;
        });
        _progressController.forward(from: 0.0);
        _controller.forward();
      } else {
        _progressController.stop();
        _controller.reverse().then((_) {
          if (!mounted) return;
          _progressController.reset();
          setState(() {
            _visible = false;
          });
        });
      }
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor =
        _isDarkToLight
            ? AppColors.scaffoldLightColor
            : AppColors.scaffoldDarkColor;
    final fontColor =
        _isDarkToLight
            ? AppColors.scaffoldDarkColor
            : AppColors.scaffoldLightColor;
    final themeImage =
        _isDarkToLight
            ? 'assets/images/others/theme_loading_light.webp'
            : 'assets/images/others/theme_loading_dark.webp';

    final switchMode =
        _isDarkToLight
            ? ThemeSwitchMode.darkToLight
            : ThemeSwitchMode.lightToDark;

    return Stack(
      children: [
        widget.child,
        if (_visible)
          FadeTransition(
            opacity: _opacityAnimation,
            child: IgnorePointer(
              ignoring: !widget.isSwitching,
              child: Material(
                color: bgColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.spaceXL),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ThemeSwitchIndicator(mode: switchMode),
                        const SizedBox(height: AppConstants.spaceM),
                        Image.asset(
                          themeImage,
                          width: MediaQuery.sizeOf(
                            context,
                          ).width.clamp(240.0, 750.0),
                          fit: BoxFit.contain,
                          gaplessPlayback: true,
                        ),
                        const SizedBox(height: AppConstants.spaceM),
                        CornerHighlight(
                          corner: SparkleCorner.topRight,
                          color: AppColors.primaryPurpleDark,
                          child: Text(
                            'Switching vibes...',
                            style: TextStyle(color: fontColor),
                          ),
                        ),
                        const SizedBox(height: AppConstants.spaceL),
                        AnimatedBuilder(
                          animation: _progressAnimation,
                          builder: (context, _) {
                            return StripedLoadingBar(
                              progress: _progressAnimation.value,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
