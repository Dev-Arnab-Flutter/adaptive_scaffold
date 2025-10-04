import 'package:flutter/material.dart';

import 'breakpoints.dart';

typedef AdaptoWidgetBuilder = Widget Function(
    BuildContext context, AdaptoLayoutType layout);

/// A flexible builder for adaptive layouts
class AdaptoBuilder extends StatelessWidget {
  final AdaptoWidgetBuilder builder;

  const AdaptoBuilder({super.key, required this.builder});

  AdaptoLayoutType _getLayoutType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < AdaptoBreakpoints.mobile) return AdaptoLayoutType.mobile;
    if (width < AdaptoBreakpoints.tablet) return AdaptoLayoutType.tablet;
    return AdaptoLayoutType.desktop;
  }

  @override
  Widget build(BuildContext context) {
    return builder(context, _getLayoutType(context));
  }
}
