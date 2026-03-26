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
  });

  final int completedLoops;
  final String currentTemplateTitle;
  final String currentStepLabel;
  final int successStreak;
  final int struggleStreak;
  final String recommendationText;

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
      ],
    );
  }
}
