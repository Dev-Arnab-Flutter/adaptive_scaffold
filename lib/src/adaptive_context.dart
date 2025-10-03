import 'package:flutter/material.dart';
import 'breakpoints.dart';

extension AdaptiveContext on BuildContext {
  bool get isMobile =>
      MediaQuery.of(this).size.width < AdaptiveBreakpoints.mobile;

  bool get isTablet =>
      MediaQuery.of(this).size.width >= AdaptiveBreakpoints.mobile &&
      MediaQuery.of(this).size.width < AdaptiveBreakpoints.tablet;

  bool get isDesktop =>
      MediaQuery.of(this).size.width >= AdaptiveBreakpoints.tablet;

  AdaptiveLayoutType get layout {
    if (isMobile) return AdaptiveLayoutType.mobile;
    if (isTablet) return AdaptiveLayoutType.tablet;
    return AdaptiveLayoutType.desktop;
  }
}
