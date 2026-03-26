import 'package:flutter/material.dart';

import '../learning/models/exercise_template.dart';
import '../learning/models/learning_step.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final item = kA1Templates.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Uebung', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text('${item.level}: ${item.title}'),
        const SizedBox(height: 8),
        Text(item.prompt),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: item.steps
                  .map(
                    (step) => Chip(
                      label: Text(_label(step)),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  String _label(LearningStep step) {
    switch (step) {
      case LearningStep.decode:
        return 'Dekodieren';
      case LearningStep.listen:
        return 'Hoeren';
      case LearningStep.speak:
        return 'Antworten';
      case LearningStep.transfer:
        return 'Transfer';
    }
  }
}
