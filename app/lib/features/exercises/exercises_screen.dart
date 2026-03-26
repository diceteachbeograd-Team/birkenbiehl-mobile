import 'package:flutter/material.dart';

import '../learning/models/exercise_template.dart';
import '../learning/models/learning_step.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({
    super.key,
    required this.template,
    required this.currentStepIndex,
    required this.onNextStep,
    required this.onPrevStep,
    required this.onReset,
  });

  final ExerciseTemplate template;
  final int currentStepIndex;
  final VoidCallback onNextStep;
  final VoidCallback onPrevStep;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final steps = template.steps;
    final currentStep = steps[currentStepIndex];
    final progress = (currentStepIndex + 1) / steps.length;

    return ListView(
      children: [
        Text('Uebung', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text('${template.level}: ${template.title}'),
        const SizedBox(height: 8),
        Text(template.prompt),
        const SizedBox(height: 12),
        Text('Aktueller Schritt: ${currentStep.label}'),
        const SizedBox(height: 6),
        LinearProgressIndicator(value: progress),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var i = 0; i < steps.length; i++)
                  Chip(
                    backgroundColor: i == currentStepIndex
                        ? Theme.of(context).colorScheme.primaryContainer
                        : null,
                    label: Text(steps[i].label),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                key: const Key('prevLearningStepButton'),
                onPressed: onPrevStep,
                child: const Text('Zurueck'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton(
                key: const Key('nextLearningStepButton'),
                onPressed: onNextStep,
                child: const Text('Weiter'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextButton(
          key: const Key('resetLearningStepButton'),
          onPressed: onReset,
          child: const Text('Loop neu starten'),
        ),
      ],
    );
  }
}
