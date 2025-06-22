import 'package:flutter/material.dart';

const _primaryColor = Color.fromARGB(255, 64, 138, 203);
const _secondaryColor = Color.fromARGB(255, 96, 99, 195);
const _successColor = Color(0xFF77b300);
const _infoColor = Color(0xFF9933cc);
const _warningColor = Color(0xFFff8800);
const _dangerColor = Color.fromARGB(255, 223, 48, 36);
const _lightColor = Color(0xFFf8f9fa);
const _darkColor = Color(0xFF060606);

const _onPrimaryColor = Colors.black;
const _onSecondaryColor = Colors.white;
const _onsuccessColor = Colors.white;
const _onInfoColor = Colors.white;
const _onWarningColor = Colors.black;
const _onDangerColor = Colors.white;
const _onLightColor = Colors.black;
const _onDarkColor = Colors.white;

const _textColorDark = _darkColor;
const _textColorLight = _lightColor;

enum AppColorVariant {
  primary(_primaryColor, _onPrimaryColor),
  secondary(_secondaryColor, _onSecondaryColor),
  info(_infoColor, _onInfoColor),
  success(_successColor, _onsuccessColor),
  warning(_warningColor, _onWarningColor),
  danger(_dangerColor, _onDangerColor),
  light(_lightColor, _onLightColor),
  dark(_darkColor, _onDarkColor),
  ;

  final Color color;
  final Color onColor;
  const AppColorVariant(this.color, this.onColor);
}

enum AppSizeVariant {
  xs,
  sm,
  md,
  lg,
  xl,
}

extension CustomColorScheme on ColorScheme {
  Color get primary => _primaryColor;
  Color get secondary => _secondaryColor;
  Color get success => _successColor;
  Color get info => _infoColor;
  Color get warning => _warningColor;
  Color get danger => _dangerColor;
  Color get light => _lightColor;
  Color get dark => _darkColor;

  Color get text =>
      brightness == Brightness.light ? _textColorDark : _textColorLight;

  Color get primaryButtonBg => primary;
  Color get primaryButtonFg => const Color(0xFFFFFFFF);

  Color get secondaryButtonBg => secondary;
  Color get secondaryButtonFg => const Color(0xFFFFFFFF);

  Color get infoButtonBg => info;
  Color get infoButtonFg => const Color(0xFFFFFFFF);

  Color get dangerButtonBg => danger;
  Color get dangerButtonFg => const Color(0xFFFFFFFF);

  Color get successButtonBg => success;
  Color get successButtonFg => const Color(0xFFFFFFFF);

  Color get warningButtonBg => warning;
  Color get warningButtonFg => const Color(0xFFFFFFFF);

  Color get lightButtonBg => light;
  Color get lightButtonFg => const Color(0xFF000000);

  Color get darkButtonBg => dark;
  Color get darkButtonFg => const Color(0xFFFFFFFF);

  Color get drawerBackground =>
      brightness == Brightness.light ? Colors.white70 : Colors.black87;
  Color get bottomSheetBackground =>
      brightness == Brightness.light ? Colors.white70 : Colors.black87;
}

class AppTheme {
  final ThemeData themeData;

  const AppTheme({
    required this.themeData,
  });

  factory AppTheme.light() {
    return AppTheme(
      themeData: ThemeData(
        useMaterial3: true,
        dialogTheme:
            const DialogThemeData(titleTextStyle: TextStyle(fontSize: 16)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryColor,
          brightness: Brightness.light,
        ),
      ),
    );
  }

  factory AppTheme.dark() {
    return AppTheme(
      themeData: ThemeData(
        useMaterial3: true,
        dialogTheme:
            const DialogThemeData(titleTextStyle: TextStyle(fontSize: 16)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryColor,
          brightness: Brightness.dark,
        ),
      ),
    );
  }

  static Color appVariantToColor(
    BuildContext context,
    AppColorVariant variant, [
    double opacity = 1.0,
  ]) {
    return variant.color.withOpacity(opacity);
  }
}
