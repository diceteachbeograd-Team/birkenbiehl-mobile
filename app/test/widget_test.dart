import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app/main.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Main shell renders and allows navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BirkenbiehlApp());
    await tester.pumpAndSettle();

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
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.extension_rounded));
    await tester.pumpAndSettle();

    expect(
      find.textContaining('Aktueller Schritt: Dekodieren'),
      findsOneWidget,
    );

    await tester.scrollUntilVisible(
      find.byKey(const Key('markSuccessButton')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.byKey(const Key('markSuccessButton')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('markSuccessButton')));
    await tester.pump();

    expect(find.textContaining('Aktueller Schritt: Hoeren'), findsOneWidget);
  });

  testWidgets('Parent mode exposes markdown and pdf export actions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BirkenbiehlApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.admin_panel_settings_rounded));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(const Key('exportMarkdownButton')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.byKey(const Key('exportMarkdownButton')), findsOneWidget);
    expect(find.byKey(const Key('exportPdfButton')), findsOneWidget);
  });
}
