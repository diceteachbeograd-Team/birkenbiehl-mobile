import 'package:flutter/material.dart';

class ListeningScreen extends StatelessWidget {
  const ListeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Hoeren', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Passiv hoeren mit klarer Markierung und ruhigem Tempo.'),
        const SizedBox(height: 16),
        const Card(
          child: ListTile(
            leading: Icon(Icons.headphones_rounded),
            title: Text('Audio-Loop 01'),
            subtitle: Text('3 Wiederholungen, langsam.'),
          ),
        ),
      ],
    );
  }
}
