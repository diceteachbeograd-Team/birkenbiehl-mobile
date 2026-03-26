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
  ExerciseTemplate(
    id: 'a1_family_01',
    title: 'Familie vorstellen',
    level: 'A1',
    prompt: 'Sagen, wer zur Familie gehoert.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_food_01',
    title: 'Essen bestellen',
    level: 'A1',
    prompt: 'Ein einfaches Gericht nennen und reagieren.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_playground_01',
    title: 'Spielplatz Regeln',
    level: 'A1',
    prompt: 'Kurze Aufforderungen verstehen und antworten.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_weather_01',
    title: 'Wetter beschreiben',
    level: 'A1',
    prompt: 'Einfach sagen, wie das Wetter ist.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_time_01',
    title: 'Uhrzeit verstehen',
    level: 'A1',
    prompt: 'Kurze Zeitangaben hoeren und wiedergeben.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_shopping_01',
    title: 'Im Laden fragen',
    level: 'A1',
    prompt: 'Preis oder Produkt einfach erfragen.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_transport_01',
    title: 'Bus und Bahn',
    level: 'A1',
    prompt: 'Nach Weg und Haltestelle fragen.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_health_01',
    title: 'Ich fuehle mich',
    level: 'A1',
    prompt: 'Einfaches Befinden ausdruecken.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_hobby_01',
    title: 'Hobbys nennen',
    level: 'A1',
    prompt: 'Sagen, was man gern macht.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
  ExerciseTemplate(
    id: 'a1_classroom_01',
    title: 'Im Klassenraum',
    level: 'A1',
    prompt: 'Objekte benennen und kurze Fragen beantworten.',
    steps: [
      LearningStep.decode,
      LearningStep.listen,
      LearningStep.speak,
      LearningStep.transfer,
    ],
  ),
];
