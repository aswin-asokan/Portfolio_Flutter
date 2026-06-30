import 'package:flutter/material.dart';
import 'package:portfolio/core/assets/app_assets.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/shared/widgets/corner_highlight.dart';
import 'package:portfolio/features/shared/widgets/striped_loading_bar.dart';

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

  int get _assetCount => AppAssets.criticalImages.length;

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
      for (final asset in AppAssets.criticalImages) {
        final ImageProvider provider = asset.cacheWidth != null
            ? ResizeImage(AssetImage(asset.path), width: asset.cacheWidth)
            : AssetImage(asset.path);
            
        await precacheImage(provider, context);
        updateProgress();
      }

      if (!mounted) return;
      setState(() {
        _progress = 1;
        _isLoaded = true;
      });
      
      _loadSecondaryAssets();
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
  
  Future<void> _loadSecondaryAssets() async {
    for (final asset in AppAssets.secondaryImages) {
      if (!mounted) return;
      final ImageProvider provider = asset.cacheWidth != null
          ? ResizeImage(AssetImage(asset.path), width: asset.cacheWidth)
          : AssetImage(asset.path);
          
      precacheImage(provider, context).catchError((_) {});
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
              Image.asset(
                AppAssets.logoLight,
                height: 60,
                fit: BoxFit.contain,
                gaplessPlayback: true,
              ),
              const SizedBox(height: AppConstants.spaceM),
              Image.asset(
                AppAssets.loadingImage,
                width: imageSize,
                cacheWidth: 800,
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
              StripedLoadingBar(progress: progress),
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

