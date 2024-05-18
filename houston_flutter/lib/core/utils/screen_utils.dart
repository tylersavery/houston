// import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenSize {
  sm,
  md,
  lg,
}

class ScreenUtils {
  static const breakpointSm = 576.0;
  static const breakpointMd = 992.0;
  static const minWindowWidthDesktop = 1200.0;
  static const minWindowHeightDesktop = 800.0;

  static const bool isWeb = kIsWeb;

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static ScreenSize size(BuildContext context) {
    if (width(context) < breakpointSm) {
      return ScreenSize.sm;
    }

    if (width(context) < breakpointMd) {
      return ScreenSize.md;
    }

    return ScreenSize.lg;
  }

  static bool atLeast(BuildContext context, ScreenSize size) {
    final s = ScreenUtils.size(context);

    switch (size) {
      case ScreenSize.sm:
        return true;
      case ScreenSize.md:
        return s == ScreenSize.md || s == ScreenSize.lg;
      case ScreenSize.lg:
        return s == ScreenSize.lg;
    }
  }

  static bool atMost(BuildContext context, ScreenSize size) {
    final s = ScreenUtils.size(context);

    switch (size) {
      case ScreenSize.lg:
        return true;
      case ScreenSize.md:
        return s == ScreenSize.md || s == ScreenSize.sm;
      case ScreenSize.sm:
        return s == ScreenSize.sm;
    }
  }
}
