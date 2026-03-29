class LevelingDecision {
  const LevelingDecision({
    required this.level,
    required this.nextStreak,
    required this.struggleStreak,
    required this.upgraded,
    required this.downgraded,
  });

  final String level;
  final int nextStreak;
  final int struggleStreak;
  final bool upgraded;
  final bool downgraded;
}

class LevelingEngine {
  static const List<String> kOrderedLevels = <String>[
    'A1.1',
    'A1.2',
    'A2.1',
    'A2.2',
    'B1.1',
    'B1.2',
  ];

  const LevelingEngine();

  LevelingDecision evaluate({
    required String currentLevel,
    required double score,
    required int successStreak,
    required int struggleStreak,
  }) {
    final index = _normalizeIndex(currentLevel);

    if (score >= 0.85) {
      final newSuccess = successStreak + 1;
      if (newSuccess >= 3 && index < kOrderedLevels.length - 1) {
        return LevelingDecision(
          level: kOrderedLevels[index + 1],
          nextStreak: 0,
          struggleStreak: 0,
          upgraded: true,
          downgraded: false,
        );
      }
      return LevelingDecision(
        level: kOrderedLevels[index],
        nextStreak: newSuccess,
        struggleStreak: 0,
        upgraded: false,
        downgraded: false,
      );
    }

    if (score <= 0.4) {
      final newStruggle = struggleStreak + 1;
      if (newStruggle >= 3 && index > 0) {
        return LevelingDecision(
          level: kOrderedLevels[index - 1],
          nextStreak: 0,
          struggleStreak: 0,
          upgraded: false,
          downgraded: true,
        );
      }
      return LevelingDecision(
        level: kOrderedLevels[index],
        nextStreak: 0,
        struggleStreak: newStruggle,
        upgraded: false,
        downgraded: false,
      );
    }

    return LevelingDecision(
      level: kOrderedLevels[index],
      nextStreak: 0,
      struggleStreak: 0,
      upgraded: false,
      downgraded: false,
    );
  }

  int _normalizeIndex(String level) {
    final idx = kOrderedLevels.indexOf(level);
    if (idx >= 0) {
      return idx;
    }
    return 0;
  }
}
