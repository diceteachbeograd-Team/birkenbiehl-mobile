import 'package:flutter/material.dart';

import '../../core/i18n/app_strings.dart';
import '../../core/models/assistive_profile.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.profile,
    required this.currentStepLabel,
    required this.completedLoops,
    required this.recommendationText,
    required this.gameStars,
    required this.gameBadges,
    required this.questProgress,
    required this.onStartLearning,
    required this.strings,
  });

  final AssistiveProfile profile;
  final String currentStepLabel;
  final int completedLoops;
  final String recommendationText;
  final int gameStars;
  final int gameBadges;
  final int questProgress;
  final VoidCallback onStartLearning;
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    final activeHelpText = _activeHelpText(profile);

    return ListView(
      children: [
        Text(
          strings.tabStart,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(strings.startTodayText),
        const SizedBox(height: 16),
        Semantics(
          label: 'Lernstart mit naechster Aufgabe',
          button: true,
          child: FilledButton.icon(
            key: const Key('startLearningButton'),
            onPressed: onStartLearning,
            icon: const Icon(Icons.play_arrow_rounded),
            label: Text(strings.startNextTask),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.route_rounded),
            title: Text(strings.startLearningLoop),
            subtitle: Text('${strings.startCurrent}: $currentStepLabel'),
          ),
        ),
        const SizedBox(height: 8),
        Text('${strings.startCompletedLoops}: $completedLoops'),
        Text(
          '${strings.startGameStars}: $gameStars | ${strings.startBadges}: $gameBadges',
        ),
        Text('${strings.startDailyQuest}: $questProgress/5'),
        Text('${strings.startHelpActive}: $activeHelpText'),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.tips_and_updates_rounded),
            title: Text(strings.startRecommendation),
            subtitle: Text(recommendationText),
          ),
        ),
      ],
    );
  }

  String _activeHelpText(AssistiveProfile profile) {
    final parts = <String>[];
    if (profile.hearingAssist) {
      parts.add('Hoeren');
    }
    if (profile.visionAssist) {
      parts.add('Sehen');
    }
    if (parts.isEmpty) {
      return 'Keine';
    }
    return parts.join(' + ');
  }
}
