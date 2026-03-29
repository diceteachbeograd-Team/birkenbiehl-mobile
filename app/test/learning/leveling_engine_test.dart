import 'package:app/features/learning/services/leveling_engine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const engine = LevelingEngine();

  test('upgrades after three strong scores', () {
    var r = engine.evaluate(
      currentLevel: 'A1.1',
      score: 0.9,
      successStreak: 0,
      struggleStreak: 0,
    );
    r = engine.evaluate(
      currentLevel: r.level,
      score: 0.92,
      successStreak: r.nextStreak,
      struggleStreak: r.struggleStreak,
    );
    r = engine.evaluate(
      currentLevel: r.level,
      score: 0.89,
      successStreak: r.nextStreak,
      struggleStreak: r.struggleStreak,
    );

    expect(r.upgraded, isTrue);
    expect(r.level, 'A1.2');
  });

  test('downgrades after three weak scores', () {
    var r = engine.evaluate(
      currentLevel: 'A2.1',
      score: 0.2,
      successStreak: 0,
      struggleStreak: 0,
    );
    r = engine.evaluate(
      currentLevel: r.level,
      score: 0.35,
      successStreak: r.nextStreak,
      struggleStreak: r.struggleStreak,
    );
    r = engine.evaluate(
      currentLevel: r.level,
      score: 0.3,
      successStreak: r.nextStreak,
      struggleStreak: r.struggleStreak,
    );

    expect(r.downgraded, isTrue);
    expect(r.level, 'A1.2');
  });

  test('resets streaks on medium score', () {
    final r = engine.evaluate(
      currentLevel: 'A1.2',
      score: 0.6,
      successStreak: 2,
      struggleStreak: 1,
    );

    expect(r.level, 'A1.2');
    expect(r.nextStreak, 0);
    expect(r.struggleStreak, 0);
  });
}
