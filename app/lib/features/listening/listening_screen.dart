import 'package:flutter/material.dart';

class ListeningScreen extends StatefulWidget {
  const ListeningScreen({
    super.key,
    required this.onRoundSolved,
    required this.globalStars,
    required this.globalBadges,
  });

  final ValueChanged<bool> onRoundSolved;
  final int globalStars;
  final int globalBadges;

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  int _roundIndex = 0;
  int _localScore = 0;
  int? _selectedOption;
  bool _answered = false;
  int _playCount = 0;

  static const _rounds = [
    (
      prompt: 'Du hoerst: "Hello, how are you?"',
      options: ['Wie geht es dir?', 'Wo wohnst du?', 'Ich bin sieben.'],
      correct: 0,
    ),
    (
      prompt: 'Du hoerst: "I like apples."',
      options: ['Ich mag Aepfel.', 'Ich sehe einen Bus.', 'Das ist mein Hund.'],
      correct: 0,
    ),
    (
      prompt: 'Du hoerst: "Where is the station?"',
      options: ['Wann ist es?', 'Wo ist der Bahnhof?', 'Ich kann tanzen.'],
      correct: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final round = _rounds[_roundIndex];
    final isFinished = _roundIndex >= _rounds.length - 1 && _answered;

    return ListView(
      children: [
        Text('Hoeren Spiel', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'Sterne: ${widget.globalStars} | Abzeichen: ${widget.globalBadges}',
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(value: (_roundIndex + 1) / _rounds.length),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.headphones_rounded),
            title: Text('Runde ${_roundIndex + 1} von ${_rounds.length}'),
            subtitle: Text('Lokal geloest: $_localScore'),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(round.prompt),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  key: const Key('playListeningAudioButton'),
                  onPressed: () {
                    setState(() {
                      _playCount++;
                    });
                  },
                  icon: const Icon(Icons.volume_up_rounded),
                  label: Text('Audio abspielen ($_playCount)'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...List.generate(round.options.length, (index) {
          final selected = _selectedOption == index;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: OutlinedButton.icon(
              key: Key('listeningOption$index'),
              onPressed: _answered ? null : () => _answer(index),
              icon: Icon(
                selected ? Icons.radio_button_checked : Icons.circle_outlined,
              ),
              label: Text(round.options[index]),
            ),
          );
        }),
        if (_answered)
          Card(
            child: ListTile(
              leading: Icon(
                _selectedOption == round.correct
                    ? Icons.check_circle
                    : Icons.info,
              ),
              title: Text(
                _selectedOption == round.correct
                    ? 'Richtig gehoert'
                    : 'Fast! Noch mal hoeren.',
              ),
              subtitle: Text(
                _selectedOption == round.correct
                    ? 'Sehr gut. Du bekommst einen Stern.'
                    : 'Tip: Audio 1-2x nochmal starten.',
              ),
            ),
          ),
        const SizedBox(height: 8),
        FilledButton.icon(
          key: const Key('nextListeningRoundButton'),
          onPressed: _answered
              ? () {
                  if (isFinished) {
                    _restart();
                    return;
                  }
                  setState(() {
                    _roundIndex++;
                    _selectedOption = null;
                    _answered = false;
                    _playCount = 0;
                  });
                }
              : null,
          icon: Icon(
            isFinished
                ? Icons.restart_alt_rounded
                : Icons.arrow_forward_rounded,
          ),
          label: Text(isFinished ? 'Spiel neu starten' : 'Naechste Runde'),
        ),
      ],
    );
  }

  void _answer(int optionIndex) {
    final round = _rounds[_roundIndex];
    final correct = optionIndex == round.correct;

    setState(() {
      _selectedOption = optionIndex;
      _answered = true;
      if (correct) {
        _localScore++;
      }
    });

    widget.onRoundSolved(correct);
  }

  void _restart() {
    setState(() {
      _roundIndex = 0;
      _selectedOption = null;
      _answered = false;
      _playCount = 0;
      _localScore = 0;
    });
  }
}
