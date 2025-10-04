import 'package:flutter/material.dart';

import 'breakpoints.dart';

extension AdaptoContext on BuildContext {
  bool get isMobile =>
      MediaQuery.of(this).size.width < AdaptoBreakpoints.mobile;

  bool get isTablet =>
      MediaQuery.of(this).size.width >= AdaptoBreakpoints.mobile &&
      MediaQuery.of(this).size.width < AdaptoBreakpoints.tablet;

  bool get isDesktop =>
      MediaQuery.of(this).size.width >= AdaptoBreakpoints.tablet;

  AdaptoLayoutType get layout {
    if (isMobile) return AdaptoLayoutType.mobile;
    if (isTablet) return AdaptoLayoutType.tablet;
    return AdaptoLayoutType.desktop;
  }
}
