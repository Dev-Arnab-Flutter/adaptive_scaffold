import 'package:adaptive_scaffold/src/adaptive_builder.dart';
import 'package:adaptive_scaffold/src/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AdaptiveBuilder shows correct child', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(500, 800)), // mobile
          child: AdaptiveBuilder(
            builder: (BuildContext context, AdaptiveLayoutType layout) {
              return Text('Mobile Builder');
            },
          ),
        ),
      ),
    );

    expect(find.text('Mobile Builder'), findsOneWidget);
  });

  testWidgets('AdaptiveBuilder switches correctly with width', (tester) async {
    // Tablet mode
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(900, 600)),
          child: AdaptiveBuilder(
            builder: (BuildContext context, AdaptiveLayoutType layout) {
              return Text('Tablet Builder');
            },
          ),
        ),
      ),
    );
    expect(find.text('Tablet Builder'), findsOneWidget);

    // Desktop mode
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(1600, 900)),
          child: AdaptiveBuilder(
            builder: (BuildContext context, AdaptiveLayoutType layout) {
              return Text('Desktop Builder');
            },
          ),
        ),
      ),
    );
    expect(find.text('Desktop Builder'), findsOneWidget);
  });

  test('Breakpoints default values', () {
    expect(AdaptiveBreakpoints.mobile, 600);
    expect(AdaptiveBreakpoints.tablet, 1024);
  });
}
