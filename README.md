# 📦 adaptive_scaffold

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)  
[![pub package](https://img.shields.io/pub/v/adaptive_scaffold.svg)](https://pub.dev/packages/adaptive_scaffold)

A **drop-in replacement for Flutter's Scaffold** that adapts automatically to **mobile, tablet, and desktop layouts**.  
It helps you build **responsive apps** that automatically switch layouts, navigation, and content based on screen size.

---

## 🚀 Features

- Adaptive body (mobile / tablet / desktop)
- Adaptive navigation (BottomNavigationBar → NavigationRail → Drawer)
- `AdaptiveBuilder` API for flexible custom layouts
- `context.isMobile / context.isTablet / context.isDesktop` extensions
- Configurable breakpoints
- Drop-in replacement for Scaffold with all original functionality

---

## 🛠 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  adaptive_scaffold: ^0.0.1


Then run:

flutter pub get


📄 Usage
1️⃣ AdaptiveScaffold Example
import 'package:flutter/material.dart';
import 'package:adaptive_scaffold/adaptive_scaffold.dart';

AdaptiveScaffold(
  appBar: AppBar(title: Text("Adaptive Scaffold")),
  mobileBody: Center(child: Text("📱 Mobile Layout")),
  tabletBody: Center(child: Text("📟 Tablet Layout")),
  desktopBody: Center(child: Text("🖥 Desktop Layout")),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
);

2️⃣ AdaptiveNavigationBar Example
AdaptiveNavigationBar(
  destinations: [
    AdaptiveDestination(icon: Icons.home, label: "Home", body: HomePage()),
    AdaptiveDestination(icon: Icons.settings, label: "Settings", body: SettingsPage()),
  ],
);

📸 Demo

Mobile Layout:


Tablet Layout:


Desktop Layout:


You can replace the placeholders with actual screenshots or GIFs of your app.

🔎 AdaptiveBuilder Example

Use AdaptiveBuilder to create custom layouts based on screen size:

AdaptiveBuilder(
  builder: (context, layout) {
    switch (layout) {
      case AdaptiveLayoutType.mobile:
        return Text("📱 Mobile View");
      case AdaptiveLayoutType.tablet:
        return Text("📟 Tablet View");
      case AdaptiveLayoutType.desktop:
        return Text("🖥 Desktop View");
    }
  },
);

🔮 Roadmap

Automatic Drawer → NavigationRail → BottomNavigationBar transitions

Adaptive grid system for responsive layouts

Material 3 token & theme support

More examples with real apps

💡 Why Use adaptive_scaffold?

Save time writing responsive layouts

Keep original Scaffold behavior intact

Switch between layouts automatically without writing boilerplate

Compatible with Flutter mobile, tablet, and web/desktop apps

📄 License

MIT License © 2025 [Your Name]


---

✅ **Notes / Next Steps:**

1. Replace `[Your Name]` with your name or organization.  
2. Replace placeholder screenshots with **actual app screenshots** for better pub.dev presentation.  
3. You can add **Flutter and CI badges** later if you integrate GitHub Actions.  

---