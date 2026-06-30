class AssetPreload {
  final String path;
  final int? cacheWidth;
  const AssetPreload(this.path, {this.cacheWidth});
}

class AppAssets {
  static const String loadingImage = 'assets/images/others/loading_image.webp';
  static const String logoLight = 'assets/images/logo/light_logo.png';
  
  // These images are required for the initial screen, about section, and theme transition
  // We block the initial loading screen until these are ready.
  static const List<AssetPreload> criticalImages = [
    AssetPreload(loadingImage, cacheWidth: 800),
    AssetPreload(logoLight),
    AssetPreload('assets/images/hero/hero_img_dark.webp', cacheWidth: 800),
    AssetPreload('assets/images/hero/hero_img_light.webp', cacheWidth: 800),
    AssetPreload('assets/images/others/projects_hero.webp', cacheWidth: 800),
    AssetPreload('assets/images/about/about_image.webp', cacheWidth: 600),
    AssetPreload('assets/images/about/focus.webp'),
    AssetPreload('assets/images/about/fuel.webp'),
    AssetPreload('assets/images/about/hobbies.webp'),
    AssetPreload('assets/images/about/personality.webp'),
    AssetPreload('assets/images/others/theme_loading_light.webp', cacheWidth: 800),
    AssetPreload('assets/images/others/theme_loading_dark.webp', cacheWidth: 800),
  ];

  // These images can be loaded asynchronously in the background.
  static const List<AssetPreload> secondaryImages = [
    AssetPreload('assets/images/others/mace.webp'),
    AssetPreload('assets/images/others/gpc.webp'),
    AssetPreload('assets/images/pinterest/pin_img.webp', cacheWidth: 800),
    AssetPreload('assets/images/pinterest/anime_image_1.webp', cacheWidth: 800),
    AssetPreload('assets/images/pinterest/anime_image_2.webp', cacheWidth: 800),
    AssetPreload('assets/images/pinterest/anime_easter_egg.webp'),
    AssetPreload('assets/images/maps/map.webp', cacheWidth: 800),
    AssetPreload('assets/images/others/projects_hero.webp', cacheWidth: 800),
    AssetPreload('assets/images/logo/dark_logo.png'),
    AssetPreload('assets/icons/char_icon.webp'),
  ];
}
