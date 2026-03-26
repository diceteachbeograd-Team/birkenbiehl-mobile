import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    super.key,
    required this.completedLoops,
    required this.currentTemplateTitle,
    required this.currentStepLabel,
    required this.successStreak,
    required this.struggleStreak,
    required this.recommendationText,
    required this.recentEvents,
    required this.gameStars,
    required this.gameBadges,
    required this.questProgress,
  });

  final int completedLoops;
  final String currentTemplateTitle;
  final String currentStepLabel;
  final int successStreak;
  final int struggleStreak;
  final String recommendationText;
  final List<String> recentEvents;
  final int gameStars;
  final int gameBadges;
  final int questProgress;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Verlauf', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text('Aktuelle Uebung: $currentTemplateTitle'),
        Text('Aktueller Schritt: $currentStepLabel'),
        const SizedBox(height: 8),
        Text('Abgeschlossene Loops: $completedLoops'),
        Text('Spielsterne: $gameStars'),
        Text('Abzeichen: $gameBadges'),
        Text('Quest-Fortschritt: $questProgress/5'),
        Text('Erfolgsserie: $successStreak'),
        Text('Hilfeserie: $struggleStreak'),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.check_circle_outline_rounded),
            title: const Text('Fortschritt wird lokal gespeichert'),
            subtitle: Text(recommendationText),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Letzte Lernaktionen',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        if (recentEvents.isEmpty)
          const Card(
            child: ListTile(
              leading: Icon(Icons.hourglass_empty_rounded),
              title: Text('Noch keine Lernaktionen gespeichert'),
            ),
          )
        else
          ...recentEvents
              .take(8)
              .map(
                (event) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.history_rounded),
                    title: Text(event),
                  ),
                ),
              ),
      ],
    );
  }
}
