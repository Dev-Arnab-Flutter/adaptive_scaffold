# 📦 adapto_scaffold

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)  
[![pub package](https://img.shields.io/pub/v/adapto_scaffold.svg)](https://pub.dev/packages/adapto_scaffold)

A **drop-in replacement for Flutter's Scaffold** that adapts automatically to **mobile, tablet, and desktop layouts**.  
Build **responsive apps** that switch layouts, navigation, and content based on screen size.

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
  adapto_scaffold: ^0.2.2
```

Then run:

```sh
flutter pub get
```

---

## 📄 Usage

### 1️⃣ AdaptoScaffold Example

```dart
import 'package:flutter/material.dart';
import 'package:adapto_scaffold/adapto_scaffold.dart';

AdaptoScaffold(
  appBar: AppBar(title: Text("Adapto Scaffold")),
  mobileBody: Center(child: Text("📱 Mobile Layout")),
  tabletBody: Center(child: Text("📟 Tablet Layout")),
  desktopBody: Center(child: Text("🖥 Desktop Layout")),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
);
```

### 2️⃣ AdaptiveNavigationBar Example

```dart
AdaptiveNavigationBar(
  destinations: [
    AdaptiveDestination(icon: Icons.home, label: "Home", body: HomePage()),
    AdaptiveDestination(icon: Icons.settings, label: "Settings", body: SettingsPage()),
  ],
);
```

### 🔎 AdaptiveBuilder Example

Use AdaptiveBuilder to create custom layouts based on screen size:

```dart
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
```

---

## 💡 Why Use adapto_scaffold?

- Save time writing responsive layouts
- Keep original Scaffold behavior intact
- Switch between layouts automatically without boilerplate
- Compatible with Flutter mobile, tablet, and web/desktop apps

---

## 📄 License

MIT License © 2025 Dev-Arnab-Flutter
