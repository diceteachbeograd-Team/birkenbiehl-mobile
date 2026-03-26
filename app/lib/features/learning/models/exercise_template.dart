import 'learning_step.dart';

class ExerciseTemplate {
  const ExerciseTemplate({
    required this.id,
    required this.title,
    required this.level,
    required this.prompt,
    required this.steps,
  });

  final String id;
  final String title;
  final String level;
  final String prompt;
  final List<LearningStep> steps;
}

const List<ExerciseTemplate> kA1Templates = [
  ExerciseTemplate(
    id: 'a1_greeting_01',
    title: 'Begruessung im Alltag',
    level: 'A1',
    prompt: 'Hallo sagen und kurz antworten.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_school_01',
    title: 'Schule und Freunde',
    level: 'A1',
    prompt: 'Eine einfache Frage in der Schule beantworten.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_travel_01',
    title: 'Unterwegs fragen',
    level: 'A1',
    prompt: 'Weg fragen und kurz reagieren.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
];
