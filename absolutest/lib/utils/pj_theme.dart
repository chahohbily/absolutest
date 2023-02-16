import 'dart:ui';

import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  AppTheme theme<T extends AppTheme>() {
    if (T == AppTheme) {
      return Theme.of(this).extension<AppTheme>()!;
    }
    return Theme.of(this).extension<AppTheme<T>>()!;
  }
}

final ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.light);

class AppTheme<T> extends ThemeExtension<AppTheme<T>> {
  final Brightness _brightness;
  final Map<Palette, Color> _palette;
  late final Map<Texts, TextStyle> _texts;

  AppTheme(this._palette, this._brightness) {
    _initTexts();
  }

  void _initTexts() {
    final defaultColor = _palette[Palette.textMain];
    _texts = {
      for (var t in Texts.values)
        t: TextStyle(
          color: defaultColor,
          fontWeight: t.fontWeight,
          fontSize: t.fontSize,
          height: t.height,
          fontFamily: t.fontFamily,
          letterSpacing: t.letterSpacing,
        )
    };
  }

  factory AppTheme.light() => AppTheme(defaultPalette, Brightness.light);

  factory AppTheme.dark() => AppTheme(defaultDarkPalette, Brightness.dark);

  Color color(Palette p, [double? opacity]) {
    final color = _palette[p]!;
    return opacity == null ? color : color.withOpacity(opacity);
  }

  TextStyle textStyle(
      Texts texts, {
        Palette? color,
        FontWeight? fontWeight,
        List<FontFeature>? fontFeatures,
        String? fontFamily,
      }) {
    final textStyle = _texts[texts]!;
    return color == null && fontWeight == null && fontFeatures == null && fontFamily == null
        ? textStyle
        : textStyle.copyWith(
        color: color != null ? this.color(color) : null,
        fontWeight: fontWeight,
        fontFeatures: fontFeatures,
        fontFamily: fontFamily);
  }

  ThemeData get themeData {
    return ThemeData(
      fontFamily: "RobotoCondensed",
      scaffoldBackgroundColor: color(Palette.background),
    );
  }

  @override
  AppTheme<T> lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme<T>({
      for (final p in Palette.values) p: Color.lerp(color(p), other.color(p), t)!,
    }, other._brightness);
  }

  @override
  AppTheme<T> copyWith({Map<Palette, Color>? palette, Brightness? brightness}) {
    return AppTheme<T>(palette ?? _palette, brightness ?? _brightness);
  }
}

enum Palette {
  // Texts.
  textMain,
  // Elements.
  background,
  white,
  blue,
}

const defaultPalette = {
  Palette.textMain: Color(0xFFFFFFFF),
  Palette.white: Color(0xFFFFFFFF),
  Palette.background: Color(0xFF4EA3DB),
  Palette.blue: Color(0xFF3494D6),
};

const defaultDarkPalette = {
  Palette.textMain: Color(0xFFFFFFFF),
  Palette.white: Color(0xFFFFFFFF),
  Palette.background: Color(0xFF28292E),
  Palette.blue: Color(0xFF4A4B50),
};

///Пример для градиентов
enum GradientPalette {
  redGradient,
  blueGradient;
}

const defaultGradientPalette = {
  GradientPalette.redGradient: [Color(0xFFDF4A48), Color(0xFFB53CE0)],
  GradientPalette.blueGradient: [Color(0xFF48A9DF), Color(0xFFE03C8C)],
};

enum Texts {
  headerH1(48, FontWeight.w900, 65.57),
  text16(16, FontWeight.w400, 21.86),
  text12(12, FontWeight.w300, 16.39);

  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;
  final String fontFamily;
  final double? letterSpacing;

  const Texts(this.fontSize, this.fontWeight, this.lineHeight, {this.fontFamily = "Inter", this.letterSpacing});

  double get height => lineHeight / fontSize;
}

