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
    required this.recentEvents,
    required this.gameStars,
    required this.gameBadges,
    required this.questProgress,
    required this.setupCompleted,
    required this.selectedLanguage,
    required this.selectedLevel,
    required this.selectedContext,
    required this.uiLanguageCode,
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
  final List<String> recentEvents;
  final int gameStars;
  final int gameBadges;
  final int questProgress;
  final bool setupCompleted;
  final String? selectedLanguage;
  final String? selectedLevel;
  final String? selectedContext;
  final String? uiLanguageCode;
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
      recentEvents: const [],
      gameStars: 0,
      gameBadges: 0,
      questProgress: 0,
      setupCompleted: false,
      selectedLanguage: null,
      selectedLevel: null,
      selectedContext: null,
      uiLanguageCode: null,
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
  static const _keyRecentEvents = 'recent_events';
  static const _keyGameStars = 'game_stars';
  static const _keyGameBadges = 'game_badges';
  static const _keyQuestProgress = 'quest_progress';
  static const _keySetupCompleted = 'setup_completed';
  static const _keySelectedLanguage = 'selected_language';
  static const _keySelectedLevel = 'selected_level';
  static const _keySelectedContext = 'selected_context';
  static const _keyUiLanguageCode = 'ui_language_code';
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
      recentEvents: prefs.getStringList(_keyRecentEvents) ?? const [],
      gameStars: prefs.getInt(_keyGameStars) ?? 0,
      gameBadges: prefs.getInt(_keyGameBadges) ?? 0,
      questProgress: prefs.getInt(_keyQuestProgress) ?? 0,
      setupCompleted: prefs.getBool(_keySetupCompleted) ?? false,
      selectedLanguage: prefs.getString(_keySelectedLanguage),
      selectedLevel: prefs.getString(_keySelectedLevel),
      selectedContext: prefs.getString(_keySelectedContext),
      uiLanguageCode: prefs.getString(_keyUiLanguageCode),
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
    await prefs.setStringList(_keyRecentEvents, snapshot.recentEvents);
    await prefs.setInt(_keyGameStars, snapshot.gameStars);
    await prefs.setInt(_keyGameBadges, snapshot.gameBadges);
    await prefs.setInt(_keyQuestProgress, snapshot.questProgress);
    await prefs.setBool(_keySetupCompleted, snapshot.setupCompleted);

    if (snapshot.selectedLanguage != null) {
      await prefs.setString(_keySelectedLanguage, snapshot.selectedLanguage!);
    } else {
      await prefs.remove(_keySelectedLanguage);
    }
    if (snapshot.selectedLevel != null) {
      await prefs.setString(_keySelectedLevel, snapshot.selectedLevel!);
    } else {
      await prefs.remove(_keySelectedLevel);
    }
    if (snapshot.selectedContext != null) {
      await prefs.setString(_keySelectedContext, snapshot.selectedContext!);
    } else {
      await prefs.remove(_keySelectedContext);
    }
    if (snapshot.uiLanguageCode != null) {
      await prefs.setString(_keyUiLanguageCode, snapshot.uiLanguageCode!);
    } else {
      await prefs.remove(_keyUiLanguageCode);
    }

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
