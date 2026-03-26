import 'package:flutter/material.dart';

import '../../core/i18n/app_strings.dart';
import '../learning/models/exercise_template.dart';
import '../learning/models/learning_step.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({
    super.key,
    required this.template,
    required this.currentStepIndex,
    required this.successStreak,
    required this.struggleStreak,
    required this.adaptiveAssistHint,
    required this.onMarkSuccess,
    required this.onMarkNeedsHelp,
    required this.onPrevStep,
    required this.onReset,
    required this.strings,
  });

  final ExerciseTemplate template;
  final int currentStepIndex;
  final int successStreak;
  final int struggleStreak;
  final bool adaptiveAssistHint;
  final VoidCallback onMarkSuccess;
  final VoidCallback onMarkNeedsHelp;
  final VoidCallback onPrevStep;
  final VoidCallback onReset;
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    final steps = template.steps;
    final currentStep = steps[currentStepIndex];
    final progress = (currentStepIndex + 1) / steps.length;

    return ListView(
      children: [
        Text(
          strings.tabExercise,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text('${template.level}: ${template.title}'),
        const SizedBox(height: 8),
        Text(template.prompt),
        const SizedBox(height: 12),
        Text(
          '${strings.exerciseNow}: ${currentStep.labelFor(strings.languageCode)}',
        ),
        const SizedBox(height: 6),
        Text(currentStep.hintFor(strings.languageCode)),
        const SizedBox(height: 6),
        LinearProgressIndicator(value: progress),
        const SizedBox(height: 8),
        Text('${strings.exerciseSupport}: $successStreak | $struggleStreak'),
        const SizedBox(height: 8),
        if (adaptiveAssistHint)
          Card(
            child: ListTile(
              leading: Icon(Icons.lightbulb_rounded),
              title: Text(strings.exerciseTipEnabled),
              subtitle: Text(strings.exerciseTipText),
            ),
          ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var i = 0; i < steps.length; i++)
                  Semantics(
                    label:
                        'Lernschritt ${i + 1}: ${steps[i].labelFor(strings.languageCode)}',
                    child: Chip(
                      backgroundColor: i == currentStepIndex
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                      label: Text(steps[i].labelFor(strings.languageCode)),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                key: const Key('prevLearningStepButton'),
                onPressed: onPrevStep,
                icon: const Icon(Icons.arrow_back_rounded),
                label: Text(strings.exerciseBack),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextButton.icon(
                key: const Key('resetLearningStepButton'),
                onPressed: onReset,
                icon: const Icon(Icons.refresh_rounded),
                label: Text(strings.exerciseReset),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Semantics(
                label: 'Aufgabe war schwer, bitte mehr Hilfe',
                button: true,
                child: FilledButton.tonalIcon(
                  key: const Key('markNeedsHelpButton'),
                  onPressed: onMarkNeedsHelp,
                  icon: const Icon(Icons.support_rounded),
                  label: Text(strings.exerciseTooHard),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Semantics(
                label: 'Aufgabe erfolgreich geloest',
                button: true,
                child: FilledButton.icon(
                  key: const Key('markSuccessButton'),
                  onPressed: onMarkSuccess,
                  icon: const Icon(Icons.check_rounded),
                  label: Text(strings.exerciseDone),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
