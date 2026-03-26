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

    expect(find.text('Sprechen'), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.mic_rounded), findsWidgets);
    expect(find.byKey(const Key('hearingAssistToggle')), findsOneWidget);
    expect(find.byKey(const Key('visionAssistToggle')), findsOneWidget);
  });

  testWidgets('Learning loop advances from decode to listen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BirkenbiehlApp());

    await tester.tap(find.text('Uebung'));
    await tester.pump();

    expect(find.textContaining('Aktueller Schritt: Dekodieren'), findsOneWidget);

    await tester.tap(find.byKey(const Key('nextLearningStepButton')));
    await tester.pump();

    expect(find.textContaining('Aktueller Schritt: Hoeren'), findsOneWidget);
  });
}
