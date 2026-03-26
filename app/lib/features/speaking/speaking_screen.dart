import 'package:flutter/material.dart';

class SpeakingScreen extends StatelessWidget {
  const SpeakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Sprechen', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Kurze Antwort nachsprechen. Ohne Druck, mit Wiederholung.'),
        const SizedBox(height: 16),
        const Card(
          child: ListTile(
            leading: Icon(Icons.record_voice_over_rounded),
            title: Text('Vorlage abspielen'),
            subtitle: Text('Tempo kann reduziert werden.'),
          ),
        ),
        const SizedBox(height: 8),
        Semantics(
          label: 'Sprechaufnahme starten',
          button: true,
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.mic_rounded),
            label: const Text('Antwort sprechen'),
          ),
        ),
      ],
    );
  }
}
