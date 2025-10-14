// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/calm.png
  AssetGenImage get calm => const AssetGenImage('assets/icons/calm.png');

  /// File path: assets/icons/content.png
  AssetGenImage get content => const AssetGenImage('assets/icons/content.png');

  /// File path: assets/icons/happy.png
  AssetGenImage get happy => const AssetGenImage('assets/icons/happy.png');

  /// File path: assets/icons/kg.svg
  String get kg => 'assets/icons/kg.svg';

  /// File path: assets/icons/mood.svg
  String get mood => 'assets/icons/mood.svg';

  /// File path: assets/icons/moon.png
  AssetGenImage get moon => const AssetGenImage('assets/icons/moon.png');

  /// File path: assets/icons/notification.svg
  String get notification => 'assets/icons/notification.svg';

  /// File path: assets/icons/nutrition.png
  AssetGenImage get nutritionPng =>
      const AssetGenImage('assets/icons/nutrition.png');

  /// File path: assets/icons/nutrition.svg
  String get nutritionSvg => 'assets/icons/nutrition.svg';

  /// File path: assets/icons/peaceful.png
  AssetGenImage get peaceful =>
      const AssetGenImage('assets/icons/peaceful.png');

  /// File path: assets/icons/plan.svg
  String get plan => 'assets/icons/plan.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/sun.png
  AssetGenImage get sunPng => const AssetGenImage('assets/icons/sun.png');

  /// File path: assets/icons/sun.svg
  String get sunSvg => 'assets/icons/sun.svg';

  /// File path: assets/icons/week_icon.svg
  String get weekIcon => 'assets/icons/week_icon.svg';

  /// List of all assets
  List<dynamic> get values => [
    calm,
    content,
    happy,
    kg,
    mood,
    moon,
    notification,
    nutritionPng,
    nutritionSvg,
    peaceful,
    plan,
    profile,
    sunPng,
    sunSvg,
    weekIcon,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
