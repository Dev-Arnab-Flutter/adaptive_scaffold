import 'package:adaptive_scaffold/adaptive_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Shows mobile body when width < mobile breakpoint',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(400, 800)),
          child: AdaptiveScaffold(
            mobileBody: Text('Mobile View'),
            tabletBody: Text('Tablet View'),
            desktopBody: Text('Desktop View'),
          ),
        ),
      ),
    );

    expect(find.text('Mobile View'), findsOneWidget);
    expect(find.text('Tablet View'), findsNothing);
    expect(find.text('Desktop View'), findsNothing);
  });

  testWidgets('Shows tablet body when width >= mobile and < tablet',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(800, 600)),
          child: AdaptiveScaffold(
            mobileBody: Text('Mobile View'),
            tabletBody: Text('Tablet View'),
            desktopBody: Text('Desktop View'),
          ),
        ),
      ),
    );

    expect(find.text('Tablet View'), findsOneWidget);
  });

  testWidgets('Shows desktop body when width >= tablet breakpoint',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(1400, 900)),
          child: AdaptiveScaffold(
            mobileBody: Text('Mobile View'),
            tabletBody: Text('Tablet View'),
            desktopBody: Text('Desktop View'),
          ),
        ),
      ),
    );

    expect(find.text('Desktop View'), findsOneWidget);
  });

  testWidgets('Falls back to next available body if null', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(1400, 900)),
          child: AdaptiveScaffold(
            mobileBody: Text('Mobile View'),
            tabletBody: null,
            desktopBody: null,
          ),
        ),
      ),
    );

    // Desktop width, but only mobile body is provided
    expect(find.text('Mobile View'), findsOneWidget);
  });
}
