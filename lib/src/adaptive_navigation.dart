import 'package:flutter/material.dart';
import 'breakpoints.dart';

/// A destination item for adaptive navigation
class AdaptiveDestination {
  final IconData icon;
  final String label;
  final Widget body;

  const AdaptiveDestination({
    required this.icon,
    required this.label,
    required this.body,
  });
}

/// Adaptive Navigation that switches between
/// BottomNavigationBar (mobile),
/// NavigationRail (tablet),
/// NavigationDrawer (desktop).
class AdaptiveNavigationBar extends StatefulWidget {
  final List<AdaptiveDestination> destinations;
  final int initialIndex;

  const AdaptiveNavigationBar({
    super.key,
    required this.destinations,
    this.initialIndex = 0,
  });

  @override
  State<AdaptiveNavigationBar> createState() => _AdaptiveNavigationBarState();
}

class _AdaptiveNavigationBarState extends State<AdaptiveNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  AdaptiveLayoutType _getLayoutType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < AdaptiveBreakpoints.mobile) return AdaptiveLayoutType.mobile;
    if (width < AdaptiveBreakpoints.tablet) return AdaptiveLayoutType.tablet;
    return AdaptiveLayoutType.desktop;
  }

  @override
  Widget build(BuildContext context) {
    final layout = _getLayoutType(context);

    switch (layout) {
      case AdaptiveLayoutType.mobile:
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
      case AdaptiveLayoutType.tablet:
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
      case AdaptiveLayoutType.desktop:
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
