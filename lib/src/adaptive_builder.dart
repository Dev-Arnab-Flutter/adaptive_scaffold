import 'package:flutter/material.dart';
import 'breakpoints.dart';

typedef AdaptiveWidgetBuilder = Widget Function(
    BuildContext context, AdaptiveLayoutType layout);

/// A flexible builder for adaptive layouts
class AdaptiveBuilder extends StatelessWidget {
  final AdaptiveWidgetBuilder builder;

  const AdaptiveBuilder({super.key, required this.builder});

  AdaptiveLayoutType _getLayoutType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < AdaptiveBreakpoints.mobile) return AdaptiveLayoutType.mobile;
    if (width < AdaptiveBreakpoints.tablet) return AdaptiveLayoutType.tablet;
    return AdaptiveLayoutType.desktop;
  }

  @override
  Widget build(BuildContext context) {
    return builder(context, _getLayoutType(context));
  }
}
