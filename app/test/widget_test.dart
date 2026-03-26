// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('Main shell renders and allows navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BirkenbiehlApp());

    expect(find.text('Birkenbiehl Mobile'), findsOneWidget);
    expect(find.text('Start'), findsAtLeastNWidgets(1));

    await tester.tap(find.text('Sprechen'));
    await tester.pump();

    expect(find.text('Nächste Mini-Aufgabe'), findsOneWidget);
    expect(find.byKey(const Key('hearingAssistToggle')), findsOneWidget);
    expect(find.byKey(const Key('visionAssistToggle')), findsOneWidget);
  });
}
