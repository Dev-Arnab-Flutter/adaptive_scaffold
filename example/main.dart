import 'package:flutter/material.dart';
import 'package:adaptive_scaffold/adaptive_scaffold.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Scaffold Demo',
      theme: ThemeData(useMaterial3: true),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AppBar(title: const Text("Adaptive Scaffold")),
      mobileBody: const Center(child: Text("📱 Mobile Layout")),
      tabletBody: const Center(child: Text("📟 Tablet Layout")),
      desktopBody: const Center(child: Text("🖥 Desktop Layout")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: AdaptiveNavigationBar(
        destinations: const [
          AdaptiveDestination(
              icon: Icons.home,
              label: "Home",
              body: Center(child: Text("Home Page"))),
          AdaptiveDestination(
              icon: Icons.settings,
              label: "Settings",
              body: Center(child: Text("Settings Page"))),
        ],
      ),
    );
  }
}
