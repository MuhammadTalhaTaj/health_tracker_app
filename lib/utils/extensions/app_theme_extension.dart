import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color lightGrey;
  final Color extraLightGrey;
  final Color grey;
  final Gradient vertical;
  final Gradient horizontal;

  AppThemeExtension( {
    required this.extraLightGrey,
    required this.lightGrey,
    required this.vertical,
    required this.horizontal,
    required this.grey,
  });

  @override
  AppThemeExtension copyWith({
    Color? extraLightGrey,
    Color? lightGrey,
    Color? orange,
    Gradient? vertical,
    Gradient? horizontal,
  }) {
    return AppThemeExtension(
      extraLightGrey: extraLightGrey ?? this.extraLightGrey,
      lightGrey: lightGrey ?? this.lightGrey,
      vertical: vertical ?? this.vertical,
      horizontal: horizontal ?? this.horizontal, grey: orange??grey,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      extraLightGrey: Color.lerp(extraLightGrey, other.extraLightGrey, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      vertical: Gradient.lerp(vertical, other.vertical, t)!,
      horizontal: Gradient.lerp(horizontal, other.horizontal, t)!,
    );
  }
}
