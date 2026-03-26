import 'package:shared_preferences/shared_preferences.dart';

class LearningAppStateSnapshot {
  const LearningAppStateSnapshot({
    required this.hearingAssist,
    required this.visionAssist,
    required this.templateId,
    required this.currentStepIndex,
    required this.completedLoops,
    required this.successStreak,
    required this.struggleStreak,
    required this.adaptiveAssistHint,
    required this.lastUpdatedAt,
  });

  final bool hearingAssist;
  final bool visionAssist;
  final String templateId;
  final int currentStepIndex;
  final int completedLoops;
  final int successStreak;
  final int struggleStreak;
  final bool adaptiveAssistHint;
  final DateTime? lastUpdatedAt;

  factory LearningAppStateSnapshot.initial(String templateId) {
    return LearningAppStateSnapshot(
      hearingAssist: false,
      visionAssist: false,
      templateId: templateId,
      currentStepIndex: 0,
      completedLoops: 0,
      successStreak: 0,
      struggleStreak: 0,
      adaptiveAssistHint: false,
      lastUpdatedAt: null,
    );
  }
}

class LocalProgressStore {
  static const _keyHearingAssist = 'assist_hearing';
  static const _keyVisionAssist = 'assist_vision';
  static const _keyTemplateId = 'active_template_id';
  static const _keyCurrentStepIndex = 'current_step_index';
  static const _keyCompletedLoops = 'completed_loops';
  static const _keySuccessStreak = 'success_streak';
  static const _keyStruggleStreak = 'struggle_streak';
  static const _keyAdaptiveAssistHint = 'adaptive_assist_hint';
  static const _keyLastUpdatedAt = 'last_updated_at';

  Future<LearningAppStateSnapshot> load(String defaultTemplateId) async {
    final prefs = await SharedPreferences.getInstance();

    return LearningAppStateSnapshot(
      hearingAssist: prefs.getBool(_keyHearingAssist) ?? false,
      visionAssist: prefs.getBool(_keyVisionAssist) ?? false,
      templateId: prefs.getString(_keyTemplateId) ?? defaultTemplateId,
      currentStepIndex: prefs.getInt(_keyCurrentStepIndex) ?? 0,
      completedLoops: prefs.getInt(_keyCompletedLoops) ?? 0,
      successStreak: prefs.getInt(_keySuccessStreak) ?? 0,
      struggleStreak: prefs.getInt(_keyStruggleStreak) ?? 0,
      adaptiveAssistHint: prefs.getBool(_keyAdaptiveAssistHint) ?? false,
      lastUpdatedAt: DateTime.tryParse(
        prefs.getString(_keyLastUpdatedAt) ?? '',
      ),
    );
  }

  Future<void> save(LearningAppStateSnapshot snapshot) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_keyHearingAssist, snapshot.hearingAssist);
    await prefs.setBool(_keyVisionAssist, snapshot.visionAssist);
    await prefs.setString(_keyTemplateId, snapshot.templateId);
    await prefs.setInt(_keyCurrentStepIndex, snapshot.currentStepIndex);
    await prefs.setInt(_keyCompletedLoops, snapshot.completedLoops);
    await prefs.setInt(_keySuccessStreak, snapshot.successStreak);
    await prefs.setInt(_keyStruggleStreak, snapshot.struggleStreak);
    await prefs.setBool(_keyAdaptiveAssistHint, snapshot.adaptiveAssistHint);

    if (snapshot.lastUpdatedAt != null) {
      await prefs.setString(
        _keyLastUpdatedAt,
        snapshot.lastUpdatedAt!.toIso8601String(),
      );
    } else {
      await prefs.remove(_keyLastUpdatedAt);
    }
  }
}
