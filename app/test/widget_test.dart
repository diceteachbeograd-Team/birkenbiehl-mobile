import 'package:app/core/i18n/app_strings.dart';
import 'package:app/core/models/assistive_profile.dart';
import 'package:app/features/exercises/exercises_screen.dart';
import 'package:app/features/learning/models/exercise_template.dart';
import 'package:app/features/parent/parent_mode_screen.dart';
import 'package:app/features/setup/setup_flow_screen.dart';
import 'package:app/features/start/start_screen.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App smoke test shows title', (WidgetTester tester) async {
    await tester.pumpWidget(const BirkenbiehlApp());
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Birkenbiehl Mobile'), findsOneWidget);
  });

  testWidgets('Setup flow enables finish when all choices are selected', (
    WidgetTester tester,
  ) async {
    final strings = AppStrings.fromCode('de');
    var selectedLanguage = 'en';
    var selectedLevel = 'a1';
    var selectedContext = 'school';
    var finished = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SetupFlowScreen(
            selectedLanguage: selectedLanguage,
            selectedLevel: selectedLevel,
            selectedContext: selectedContext,
            onLanguageChanged: (value) => selectedLanguage = value,
            onLevelChanged: (value) => selectedLevel = value,
            onContextChanged: (value) => selectedContext = value,
            onFinish: () => finished = true,
            strings: strings,
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('setupFlow')), findsOneWidget);
    await tester.drag(find.byType(ListView), const Offset(0, -1000));
    await tester.pump();
    expect(find.byKey(const Key('finishSetupButton')), findsOneWidget);
    await tester.tap(find.byKey(const Key('finishSetupButton')));
    await tester.pump();
    expect(finished, isTrue);
  });

  testWidgets('Start CTA invokes callback', (WidgetTester tester) async {
    final strings = AppStrings.fromCode('de');
    var started = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StartScreen(
            profile: const AssistiveProfile(hearingAssist: false, visionAssist: true),
            currentStepLabel: 'Wort knacken',
            completedLoops: 1,
            recommendationText: strings.recommendationDefault,
            gameStars: 2,
            gameBadges: 0,
            questProgress: 1,
            onStartLearning: () => started = true,
            strings: strings,
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('startLearningButton')), findsOneWidget);
    await tester.tap(find.byKey(const Key('startLearningButton')));
    await tester.pump();
    expect(started, isTrue);
  });

  testWidgets('Exercises screen exposes learning controls', (
    WidgetTester tester,
  ) async {
    final strings = AppStrings.fromCode('de');
    var markSuccessTapped = false;
    var markHelpTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ExercisesScreen(
            template: kA1Templates.first,
            currentStepIndex: 0,
            successStreak: 0,
            struggleStreak: 0,
            adaptiveAssistHint: false,
            onMarkSuccess: () => markSuccessTapped = true,
            onMarkNeedsHelp: () => markHelpTapped = true,
            onPrevStep: () {},
            onReset: () {},
            strings: strings,
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('markSuccessButton')), findsOneWidget);
    expect(find.byKey(const Key('markNeedsHelpButton')), findsOneWidget);
    expect(find.byKey(const Key('prevLearningStepButton')), findsOneWidget);
    expect(find.byKey(const Key('resetLearningStepButton')), findsOneWidget);

    await tester.tap(find.byKey(const Key('markSuccessButton')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('markNeedsHelpButton')));
    await tester.pump();

    expect(markSuccessTapped, isTrue);
    expect(markHelpTapped, isTrue);
  });

  testWidgets('Parent mode exposes export and control widgets', (
    WidgetTester tester,
  ) async {
    final strings = AppStrings.fromCode('de');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ParentModeScreen(
            currentTemplateTitle: 'A1.1 • Schule',
            currentStepLabel: 'Wort knacken',
            completedLoops: 2,
            hearingAssist: false,
            visionAssist: true,
            lastUpdatedLabel: '29.03.2026 12:00',
            templates: const [
              ParentTemplateOption(id: 'a1', title: 'A1.1 • Schule'),
              ParentTemplateOption(id: 'a2', title: 'A2.1 • Familie'),
            ],
            selectedTemplateId: 'a1',
            onTemplateChanged: (_) {},
            selectedUiLanguageCode: 'de',
            onUiLanguageChanged: (_) {},
            strings: strings,
            onClearHistory: () {},
            onExportMarkdown: () async => '/tmp/test.md',
            onExportPdf: () async => '/tmp/test.pdf',
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('templateSelectorDropdown')), findsOneWidget);
    expect(find.byKey(const Key('uiLanguageSelectorDropdown')), findsOneWidget);
    expect(find.byKey(const Key('clearHistoryButton')), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -1000));
    await tester.pump();

    expect(find.byKey(const Key('exportMarkdownButton')), findsOneWidget);
    expect(find.byKey(const Key('exportPdfButton')), findsOneWidget);
  });
}
