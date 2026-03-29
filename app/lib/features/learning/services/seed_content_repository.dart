import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/exercise_template.dart';
import '../models/learning_step.dart';

class SeedContentRepository {
  const SeedContentRepository({
    this.assetPath = 'assets/seeds/de_en_birkenbihl_seed.json',
  });

  final String assetPath;

  Future<List<ExerciseTemplate>> loadTemplatesOrFallback() async {
    try {
      final raw = await rootBundle.loadString(assetPath);
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final exercises = (decoded['exercises'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .toList(growable: false);

      if (exercises.isEmpty) {
        return kA1Templates;
      }

      final grouped = <String, List<Map<String, dynamic>>>{};
      for (final ex in exercises) {
        final level = (ex['level'] as String? ?? 'A1.1').trim();
        final context = (ex['context'] as String? ?? 'general').trim();
        final key = '${level.toLowerCase()}_${context.toLowerCase()}';
        grouped.putIfAbsent(key, () => <Map<String, dynamic>>[]).add(ex);
      }

      final templates = grouped.entries.map((entry) {
        final first = entry.value.first;
        final level = (first['level'] as String? ?? 'A1.1').trim();
        final context = (first['context'] as String? ?? 'general').trim();
        final prompt = (first['prompt_l1'] as String? ?? '').trim();

        return ExerciseTemplate(
          id: entry.key,
          title: _titleFrom(level: level, context: context),
          level: level,
          prompt: prompt.isEmpty ? 'Dekodieren, hoeren, antworten.' : prompt,
          steps: const [
            LearningStep.decode,
            LearningStep.activeListen,
            LearningStep.passiveListen,
            LearningStep.activeResponse,
            LearningStep.transfer,
          ],
        );
      }).toList(growable: false);

      if (templates.isEmpty) {
        return kA1Templates;
      }

      return templates;
    } catch (_) {
      return kA1Templates;
    }
  }

  String _titleFrom({required String level, required String context}) {
    final safeContext = context.replaceAll('_', ' ').trim();
    return '$level • ${safeContext.isEmpty ? 'Alltag' : safeContext}';
  }
}
