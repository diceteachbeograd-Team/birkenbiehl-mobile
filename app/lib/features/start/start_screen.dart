import 'package:flutter/material.dart';

import '../../core/models/assistive_profile.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.profile,
  });

  final AssistiveProfile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Start',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        const Text('Heute: 3 kurze Schritte bis zur ersten sicheren Antwort.'),
        const SizedBox(height: 16),
        Semantics(
          label: 'Lernstart mit naechster Aufgabe',
          button: true,
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Naechste Aufgabe starten'),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.route_rounded),
            title: const Text('Birkenbihl-Lernloop'),
            subtitle: const Text('Dekodieren -> Hoeren -> Antworten -> Transfer'),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Hilfen aktiv: ${profile.hearingAssist ? 'Hoeren ' : ''}${profile.visionAssist ? 'Sehen' : ''}'.trim().isEmpty
              ? 'Keine'
              : '${profile.hearingAssist ? 'Hoeren ' : ''}${profile.visionAssist ? 'Sehen' : ''}',
        ),
      ],
    );
  }
}
