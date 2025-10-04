import 'package:flutter/material.dart';

import 'breakpoints.dart';

/// Adaptive Scaffold: a drop-in replacement for Scaffold
class AdaptoScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;

  final Widget? mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;

  final Color? backgroundColor;

  const AdaptoScaffold({
    super.key,
    this.appBar,
    this.mobileBody,
    this.tabletBody,
    this.desktopBody,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
  });

  AdaptoLayoutType _getLayoutType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < AdaptoBreakpoints.mobile) return AdaptoLayoutType.mobile;
    if (width < AdaptoBreakpoints.tablet) return AdaptoLayoutType.tablet;
    return AdaptoLayoutType.desktop;
  }

  @override
  Widget build(BuildContext context) {
    final layoutType = _getLayoutType(context);

    Widget? body;
    switch (layoutType) {
      case AdaptoLayoutType.mobile:
        body = mobileBody ?? tabletBody ?? desktopBody;
        break;
      case AdaptoLayoutType.tablet:
        body = tabletBody ?? mobileBody ?? desktopBody;
        break;
      case AdaptoLayoutType.desktop:
        body = desktopBody ?? tabletBody ?? mobileBody;
        break;
    }

    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      endDrawer: endDrawer,
      backgroundColor: backgroundColor,
    );
  }
}
