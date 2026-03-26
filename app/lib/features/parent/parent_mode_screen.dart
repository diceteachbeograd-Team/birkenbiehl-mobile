import 'package:flutter/material.dart';

class ParentModeScreen extends StatelessWidget {
  const ParentModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Elternmodus', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Einstellungen, Lernstand und Exporte verwalten.'),
        const SizedBox(height: 12),
        const Card(
          child: ListTile(
            leading: Icon(Icons.security_rounded),
            title: Text('Schutz aktiv'),
            subtitle: Text('Externe Aktionen nur im Elternmodus.'),
          ),
        ),
      ],
    );
  }
}
