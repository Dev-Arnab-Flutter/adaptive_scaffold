import 'package:flutter/material.dart';

import 'breakpoints.dart';

/// A destination item for adaptive navigation
class AdaptoDestination {
  final IconData icon;
  final String label;
  final Widget body;

  const AdaptoDestination({
    required this.icon,
    required this.label,
    required this.body,
  });
}

/// Adaptive Navigation that switches between
/// BottomNavigationBar (mobile),
/// NavigationRail (tablet),
/// NavigationDrawer (desktop).
class AdaptoNavigationBar extends StatefulWidget {
  final List<AdaptoDestination> destinations;
  final int initialIndex;

  const AdaptoNavigationBar({
    super.key,
    required this.destinations,
    this.initialIndex = 0,
  });

  @override
  State<AdaptoNavigationBar> createState() => _AdaptoNavigationBarState();
}

class _AdaptoNavigationBarState extends State<AdaptoNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  AdaptoLayoutType _getLayoutType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < AdaptoBreakpoints.mobile) return AdaptoLayoutType.mobile;
    if (width < AdaptoBreakpoints.tablet) return AdaptoLayoutType.tablet;
    return AdaptoLayoutType.desktop;
  }

  @override
  Widget build(BuildContext context) {
    final layout = _getLayoutType(context);

    switch (layout) {
      case AdaptoLayoutType.mobile:
        return Scaffold(
          body: widget.destinations[_selectedIndex].body,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            items: widget.destinations
                .map((d) => BottomNavigationBarItem(
                      icon: Icon(d.icon),
                      label: d.label,
                    ))
                .toList(),
            onTap: (i) => setState(() => _selectedIndex = i),
          ),
        );
      case AdaptoLayoutType.tablet:
        return Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (i) => setState(() => _selectedIndex = i),
              labelType: NavigationRailLabelType.all,
              destinations: widget.destinations
                  .map((d) => NavigationRailDestination(
                      icon: Icon(d.icon), label: Text(d.label)))
                  .toList(),
            ),
            Expanded(child: widget.destinations[_selectedIndex].body),
          ],
        );
      case AdaptoLayoutType.desktop:
        return Row(
          children: [
            Drawer(
              child: ListView(
                children: widget.destinations.asMap().entries.map((entry) {
                  final i = entry.key;
                  final d = entry.value;
                  return ListTile(
                    leading: Icon(d.icon),
                    title: Text(d.label),
                    selected: i == _selectedIndex,
                    onTap: () => setState(() => _selectedIndex = i),
                  );
                }).toList(),
              ),
            ),
            Expanded(child: widget.destinations[_selectedIndex].body),
          ],
        );
    }
  }
}
