import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Verlauf', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Heute abgeschlossen: 2 von 3 Mini-Schritten.'),
        const SizedBox(height: 12),
        const Card(
          child: ListTile(
            leading: Icon(Icons.check_circle_outline_rounded),
            title: Text('Stark: Begruessung sicher'),
            subtitle: Text('Naechstes Ziel: Frage stellen und reagieren.'),
          ),
        ),
      ],
    );
  }
}
