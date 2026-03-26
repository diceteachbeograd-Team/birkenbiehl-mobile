import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    super.key,
    required this.completedLoops,
    required this.currentTemplateTitle,
    required this.currentStepLabel,
  });

  final int completedLoops;
  final String currentTemplateTitle;
  final String currentStepLabel;

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
        const SizedBox(height: 12),
        const Card(
          child: ListTile(
            leading: Icon(Icons.check_circle_outline_rounded),
            title: Text('Fortschritt wird lokal gespeichert'),
            subtitle: Text('Naechstes Ziel: sichere Antwort ohne Hilfe.'),
          ),
        ),
      ],
    );
  }
}
