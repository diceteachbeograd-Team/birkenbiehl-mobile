import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app/main.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Setup flow appears first and unlocks app', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BirkenbiehlApp());
    await tester.pumpAndSettle();

    expect(find.text('Lernstart'), findsOneWidget);
    await _completeSetupFlow(tester);

    expect(find.text('Lernspiel'), findsAtLeastNWidgets(1));
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Main shell renders and allows navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BirkenbiehlApp());
    await tester.pumpAndSettle();
    await _completeSetupFlow(tester);

    expect(find.text('Birkenbiehl Mobile'), findsOneWidget);

    await tester.tap(find.text('Sprechen'));
    await tester.pump();

    expect(find.text('Sprechen Spiel'), findsAtLeastNWidgets(1));
    expect(find.byKey(const Key('toggleRecordButton')), findsOneWidget);
    expect(find.byKey(const Key('hearingAssistToggle')), findsOneWidget);
    expect(find.byKey(const Key('visionAssistToggle')), findsOneWidget);
  });

  testWidgets('Learning loop advances from first to second phase', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BirkenbiehlApp());
    await tester.pumpAndSettle();
    await _completeSetupFlow(tester);

    expect(find.textContaining('Jetzt: Wort knacken'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.byKey(const Key('markSuccessButton')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.byKey(const Key('markSuccessButton')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('markSuccessButton')));
    await tester.pump();

    await tester.scrollUntilVisible(
      find.textContaining('Jetzt: Genau hoeren'),
      -200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.textContaining('Jetzt: Genau hoeren'), findsOneWidget);
  });

  testWidgets('Parent mode exposes control and export actions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BirkenbiehlApp());
    await tester.pumpAndSettle();
    await _completeSetupFlow(tester);

    await tester.tap(find.byIcon(Icons.admin_panel_settings_rounded));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(const Key('exportMarkdownButton')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.byKey(const Key('exportMarkdownButton')), findsOneWidget);
    expect(find.byKey(const Key('exportPdfButton')), findsOneWidget);
    expect(find.byKey(const Key('templateSelectorDropdown')), findsOneWidget);
    expect(find.byKey(const Key('clearHistoryButton')), findsOneWidget);
  });

  testWidgets('Start CTA opens exercise tab', (WidgetTester tester) async {
    await tester.pumpWidget(const BirkenbiehlApp());
    await tester.pumpAndSettle();
    await _completeSetupFlow(tester);

    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.byKey(const Key('startLearningButton')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.byKey(const Key('startLearningButton')));
    await tester.pumpAndSettle();

    expect(find.text('Lernspiel'), findsAtLeastNWidgets(1));
    await tester.scrollUntilVisible(
      find.byKey(const Key('markSuccessButton')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.byKey(const Key('markSuccessButton')), findsOneWidget);
  });
}

Future<void> _completeSetupFlow(WidgetTester tester) async {
  await tester.scrollUntilVisible(
    find.byKey(const Key('language_en')),
    -200,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.tap(find.byKey(const Key('language_en')));
  await tester.pump();
  await tester.tap(find.byKey(const Key('level_a1')));
  await tester.pump();
  await tester.scrollUntilVisible(
    find.byKey(const Key('context_school')),
    200,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.tap(find.byKey(const Key('context_school')));
  await tester.pump();
  await tester.scrollUntilVisible(
    find.byKey(const Key('finishSetupButton')),
    200,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.tap(find.byKey(const Key('finishSetupButton')));
  await tester.pumpAndSettle();
}
