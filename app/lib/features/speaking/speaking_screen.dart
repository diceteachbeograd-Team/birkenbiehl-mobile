import 'package:flutter/material.dart';

class SpeakingScreen extends StatefulWidget {
  const SpeakingScreen({
    super.key,
    required this.onAttemptRated,
    required this.globalStars,
    required this.globalBadges,
  });

  final ValueChanged<bool> onAttemptRated;
  final int globalStars;
  final int globalBadges;

  @override
  State<SpeakingScreen> createState() => _SpeakingScreenState();
}

class _SpeakingScreenState extends State<SpeakingScreen> {
  int _promptIndex = 0;
  bool _isRecording = false;
  int _goodAttempts = 0;

  static const _prompts = [
    'Sage: Hello! My name is Alex.',
    'Sage: I like apples and music.',
    'Sage: Where is the school?',
    'Sage: Today the weather is sunny.',
  ];

  @override
  Widget build(BuildContext context) {
    final prompt = _prompts[_promptIndex];
    final stickers = _goodAttempts ~/ 2;

    return ListView(
      children: [
        Text(
          'Sprechen Spiel',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          'Sterne: ${widget.globalStars} | Abzeichen: ${widget.globalBadges}',
        ),
        const SizedBox(height: 8),
        Text('Sticker verdient: $stickers'),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.record_voice_over_rounded),
            title: Text('Aufgabe ${_promptIndex + 1}/${_prompts.length}'),
            subtitle: Text(prompt),
          ),
        ),
        const SizedBox(height: 8),
        FilledButton.tonalIcon(
          key: const Key('toggleRecordButton'),
          onPressed: () {
            setState(() {
              _isRecording = !_isRecording;
            });
          },
          icon: Icon(_isRecording ? Icons.stop_rounded : Icons.mic_rounded),
          label: Text(_isRecording ? 'Aufnahme stoppen' : 'Aufnahme starten'),
        ),
        const SizedBox(height: 8),
        if (_isRecording)
          const Card(
            child: ListTile(
              leading: Icon(Icons.graphic_eq_rounded),
              title: Text('Aufnahme laeuft'),
              subtitle: Text('Sprich den Satz in deinem Tempo nach.'),
            ),
          ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                key: const Key('speakingGoodButton'),
                onPressed: () => _rateAttempt(true),
                icon: const Icon(Icons.thumb_up_alt_rounded),
                label: const Text('Hat geklappt'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                key: const Key('speakingRetryButton'),
                onPressed: () => _rateAttempt(false),
                icon: const Icon(Icons.replay_rounded),
                label: const Text('Nochmal'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _rateAttempt(bool good) {
    setState(() {
      if (good) {
        _goodAttempts++;
        _promptIndex = (_promptIndex + 1) % _prompts.length;
      }
      _isRecording = false;
    });

    widget.onAttemptRated(good);
  }
}
