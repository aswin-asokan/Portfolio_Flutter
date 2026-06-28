import 'package:flutter/material.dart';
import 'package:portfolio/core/assets/app_assets.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';

class InitialLoadingScreen extends StatefulWidget {
  const InitialLoadingScreen({super.key, required this.child});

  final Widget child;

  @override
  State<InitialLoadingScreen> createState() => _InitialLoadingScreenState();
}

class _InitialLoadingScreenState extends State<InitialLoadingScreen> {
  bool _startedLoading = false;
  bool _isLoaded = false;
  Object? _loadError;
  double _progress = 0;

  int get _assetCount => AppAssets.rasterImages.length;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_startedLoading) {
      _startedLoading = true;
      _loadAssets();
    }
  }

  Future<void> _loadAssets() async {
    var loadedAssets = 0;

    void updateProgress() {
      loadedAssets++;
      if (!mounted) return;
      setState(() {
        _progress = loadedAssets / _assetCount;
      });
    }

    try {
      for (final asset in AppAssets.rasterImages) {
        await precacheImage(AssetImage(asset), context);
        updateProgress();
      }

      if (!mounted) return;
      setState(() {
        _progress = 1;
        _isLoaded = true;
      });
    } catch (error, stackTrace) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
          library: 'initial asset preload',
        ),
      );

      if (!mounted) return;
      setState(() {
        _loadError = error;
      });
    }
  }

  void _retry() {
    setState(() {
      _loadError = null;
      _progress = 0;
    });
    _loadAssets();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child:
          _isLoaded
              ? widget.child
              : _LoadingView(
                key: const ValueKey('initial-loading-screen'),
                progress: _progress,
                error: _loadError,
                onRetry: _retry,
              ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({
    super.key,
    required this.progress,
    required this.error,
    required this.onRetry,
  });

  final double progress;
  final Object? error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final imageSize = MediaQuery.sizeOf(context).width.clamp(240.0, 750.0);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spaceXL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.logoLight, height: 60, fit: BoxFit.contain),
              const SizedBox(height: AppConstants.spaceM),
              Image.asset(
                AppAssets.loadingImage,
                width: imageSize,
                fit: BoxFit.contain,
                gaplessPlayback: true,
              ),
              const SizedBox(height: AppConstants.spaceM),
              CornerHighlight(
                corner: SparkleCorner.topRight,
                color: AppColors.primaryPurpleDark,
                child: Text("Loading awesome ideas..."),
              ),
              const SizedBox(height: AppConstants.spaceL),
              _LoadingBar(progress: progress),
              if (error != null) ...[
                const SizedBox(height: AppConstants.spaceM),
                Text(
                  'Could not load app assets.',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.spaceS),
                TextButton(onPressed: onRetry, child: const Text('Retry')),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingBar extends StatelessWidget {
  const _LoadingBar({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final safeProgress = progress.clamp(0.0, 1.0);
    final percent = (safeProgress * 100).round();

    return SizedBox(
      width: 300,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 30,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: Colors.black87, width: 1.8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(end: safeProgress),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: value,
                        child: const SizedBox.expand(
                          child: CustomPaint(
                            painter: _StripedProgressPainter(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 40,
            child: Text(
              '$percent%',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF7B61FF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StripedProgressPainter extends CustomPainter {
  const _StripedProgressPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(size.height),
    );

    // Base purple fill
    canvas.drawRRect(rrect, Paint()..color = const Color(0xFF8B6DFF));

    // Clip to rounded progress
    canvas.save();
    canvas.clipRRect(rrect);

    // Diagonal stripes
    final stripePaint =
        Paint()
          ..color = Colors.white.withValues(alpha: 0.30)
          ..strokeWidth = 4;

    const spacing = 10.0;

    for (double x = -size.height; x < size.width + size.height; x += spacing) {
      canvas.drawLine(
        Offset(x, size.height),
        Offset(x + size.height, 0),
        stripePaint,
      );
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
