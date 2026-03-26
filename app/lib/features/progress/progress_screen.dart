import 'package:flutter/material.dart';

import '../../core/i18n/app_strings.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    super.key,
    required this.completedLoops,
    required this.currentTemplateTitle,
    required this.currentStepLabel,
    required this.successStreak,
    required this.struggleStreak,
    required this.recommendationText,
    required this.recentEvents,
    required this.gameStars,
    required this.gameBadges,
    required this.questProgress,
    required this.strings,
  });

  final int completedLoops;
  final String currentTemplateTitle;
  final String currentStepLabel;
  final int successStreak;
  final int struggleStreak;
  final String recommendationText;
  final List<String> recentEvents;
  final int gameStars;
  final int gameBadges;
  final int questProgress;
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          strings.tabProgress,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text('${strings.progressCurrentExercise}: $currentTemplateTitle'),
        Text('${strings.progressCurrentStep}: $currentStepLabel'),
        const SizedBox(height: 8),
        Text('${strings.progressCompletedLoops}: $completedLoops'),
        Text('${strings.progressGameStars}: $gameStars'),
        Text('${strings.progressBadges}: $gameBadges'),
        Text('${strings.progressQuest}: $questProgress/5'),
        Text('${strings.progressSuccessSeries}: $successStreak'),
        Text('${strings.progressHelpSeries}: $struggleStreak'),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.check_circle_outline_rounded),
            title: Text(strings.progressSaved),
            subtitle: Text(recommendationText),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          strings.progressRecentActions,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        if (recentEvents.isEmpty)
          Card(
            child: ListTile(
              leading: Icon(Icons.hourglass_empty_rounded),
              title: Text(strings.progressNoActions),
            ),
          )
        else
          ...recentEvents
              .take(8)
              .map(
                (event) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.history_rounded),
                    title: Text(event),
                  ),
                ),
              ),
      ],
    );
  }
}
