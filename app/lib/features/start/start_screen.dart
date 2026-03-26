import 'package:flutter/material.dart';

import '../../core/models/assistive_profile.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.profile,
    required this.currentStepLabel,
    required this.completedLoops,
    required this.recommendationText,
    required this.gameStars,
    required this.gameBadges,
    required this.questProgress,
    required this.onStartLearning,
  });

  final AssistiveProfile profile;
  final String currentStepLabel;
  final int completedLoops;
  final String recommendationText;
  final int gameStars;
  final int gameBadges;
  final int questProgress;
  final VoidCallback onStartLearning;

  @override
  Widget build(BuildContext context) {
    final activeHelpText = _activeHelpText(profile);

    return ListView(
      children: [
        Text('Start', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Heute: 3 kurze Schritte bis zur ersten sicheren Antwort.'),
        const SizedBox(height: 16),
        Semantics(
          label: 'Lernstart mit naechster Aufgabe',
          button: true,
          child: FilledButton.icon(
            key: const Key('startLearningButton'),
            onPressed: onStartLearning,
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Naechste Aufgabe starten'),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.route_rounded),
            title: const Text('Birkenbihl-Lernloop'),
            subtitle: Text('Aktuell: $currentStepLabel'),
          ),
        ),
        const SizedBox(height: 8),
        Text('Abgeschlossene Loops: $completedLoops'),
        Text('Spielsterne: $gameStars | Abzeichen: $gameBadges'),
        Text('Tagesquest: $questProgress/5'),
        Text('Hilfen aktiv: $activeHelpText'),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.tips_and_updates_rounded),
            title: const Text('Empfohlener naechster Schritt'),
            subtitle: Text(recommendationText),
          ),
        ),
      ],
    );
  }

  String _activeHelpText(AssistiveProfile profile) {
    final parts = <String>[];
    if (profile.hearingAssist) {
      parts.add('Hoeren');
    }
    if (profile.visionAssist) {
      parts.add('Sehen');
    }
    if (parts.isEmpty) {
      return 'Keine';
    }
    return parts.join(' + ');
  }
}
