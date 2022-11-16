// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_start/src/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Flutter Starter test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Text is present?
    expect(find.text('Home Page'), findsOneWidget);

    // Settings button present?
    expect(find.byTooltip('Settings'), findsOneWidget);
  });

  testWidgets('Settings Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Go to the Settings screen.
    await tester.tap(find.byTooltip('Settings'));
    await tester.pumpAndSettle();
    expect(find.text('System'), findsOneWidget);
    expect(find.bySubtype<RadioListTile>(), findsNWidgets(3));
    expect(find.bySubtype<Switch>(), findsOneWidget);
  });
}
