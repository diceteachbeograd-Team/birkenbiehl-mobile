import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'core/i18n/app_strings.dart';
import 'core/models/assistive_profile.dart';
import 'features/exercises/exercises_screen.dart';
import 'features/learning/models/exercise_template.dart';
import 'features/learning/models/learning_step.dart';
import 'features/learning/services/seed_content_repository.dart';
import 'features/listening/listening_screen.dart';
import 'features/parent/parent_mode_screen.dart';
import 'features/progress/progress_screen.dart';
import 'features/setup/setup_flow_screen.dart';
import 'features/speaking/speaking_screen.dart';
import 'features/start/start_screen.dart';
import 'shared/export_service.dart';
import 'shared/local_progress_store.dart';

void main() {
  runApp(const BirkenbiehlApp());
}

class BirkenbiehlApp extends StatelessWidget {
  const BirkenbiehlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birkenbiehl Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E8A5A)),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final LocalProgressStore _progressStore = LocalProgressStore();
  final ExportService _exportService = ExportService();
  final SeedContentRepository _seedRepository = const SeedContentRepository();

  int _currentIndex = 0;
  bool _isLoading = true;
  bool _setupCompleted = false;
  String _uiLanguageCode = AppStrings.normalizeCode(
    ui.PlatformDispatcher.instance.locale.languageCode,
  );
  String? _selectedLanguage;
  String? _selectedLevel;
  String? _selectedContext;

  AssistiveProfile _profile = const AssistiveProfile(
    hearingAssist: false,
    visionAssist: false,
  );

  ExerciseTemplate _activeTemplate = kA1Templates.first;
  List<ExerciseTemplate> _templates = kA1Templates;
  int _currentLearningStepIndex = 0;
  int _completedLoops = 0;
  int _successStreak = 0;
  int _struggleStreak = 0;
  bool _adaptiveAssistHint = false;
  List<String> _recentEvents = const [];
  int _gameStars = 0;
  int _gameBadges = 0;
  int _questProgress = 0;
  DateTime? _lastUpdatedAt;

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.fromCode(_uiLanguageCode);
    final tabs = <({String label, IconData icon})>[
      (label: strings.tabStart, icon: Icons.home_rounded),
      (label: strings.tabSpeaking, icon: Icons.mic_rounded),
      (label: strings.tabListening, icon: Icons.volume_up_rounded),
      (label: strings.tabExercise, icon: Icons.extension_rounded),
      (label: strings.tabProgress, icon: Icons.menu_book_rounded),
      (label: strings.tabParent, icon: Icons.admin_panel_settings_rounded),
    ];

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(strings.appTitle)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (!_setupCompleted) {
      return Scaffold(
        appBar: AppBar(title: Text(strings.appTitle)),
        body: SetupFlowScreen(
          selectedLanguage: _selectedLanguage,
          selectedLevel: _selectedLevel,
          selectedContext: _selectedContext,
          onLanguageChanged: (value) =>
              setState(() => _selectedLanguage = value),
          onLevelChanged: (value) => setState(() => _selectedLevel = value),
          onContextChanged: (value) => setState(() => _selectedContext = value),
          onFinish: _finishSetup,
          strings: strings,
        ),
      );
    }

    final currentStepLabel = _activeTemplate.steps[_currentLearningStepIndex]
        .labelFor(strings.languageCode);

    return Scaffold(
      appBar: AppBar(title: Text(strings.appTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _buildScreen(currentStepLabel, strings)),
            const SizedBox(height: 8),
            Semantics(
              label: 'Hoerhilfe umschalten',
              toggled: _profile.hearingAssist,
              child: SwitchListTile(
                key: const Key('hearingAssistToggle'),
                title: const Text('Hoerhilfe'),
                subtitle: const Text('Untertitel und visuelle Hinweise'),
                value: _profile.hearingAssist,
                onChanged: (v) {
                  setState(() {
                    _profile = _profile.copyWith(hearingAssist: v);
                  });
                  _saveState();
                },
              ),
            ),
            Semantics(
              label: 'Sehhilfe umschalten',
              toggled: _profile.visionAssist,
              child: SwitchListTile(
                key: const Key('visionAssistToggle'),
                title: const Text('Sehhilfe'),
                subtitle: const Text('Audiofuehrung und hoher Kontrast'),
                value: _profile.visionAssist,
                onChanged: (v) {
                  setState(() {
                    _profile = _profile.copyWith(visionAssist: v);
                  });
                  _saveState();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: tabs
            .map(
              (tab) => BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.label,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildScreen(String currentStepLabel, AppStrings strings) {
    switch (_currentIndex) {
      case 0:
        return StartScreen(
          profile: _profile,
          currentStepLabel: currentStepLabel,
          completedLoops: _completedLoops,
          recommendationText: _learningRecommendation(strings),
          gameStars: _gameStars,
          gameBadges: _gameBadges,
          questProgress: _questProgress,
          onStartLearning: _goToExercise,
          strings: strings,
        );
      case 1:
        return SpeakingScreen(
          globalStars: _gameStars,
          globalBadges: _gameBadges,
          onAttemptRated: _handleSpeakingAttempt,
          strings: strings,
        );
      case 2:
        return ListeningScreen(
          globalStars: _gameStars,
          globalBadges: _gameBadges,
          onRoundSolved: _handleListeningRound,
          strings: strings,
        );
      case 3:
        return ExercisesScreen(
          template: _activeTemplate,
          currentStepIndex: _currentLearningStepIndex,
          successStreak: _successStreak,
          struggleStreak: _struggleStreak,
          adaptiveAssistHint: _adaptiveAssistHint,
          onMarkSuccess: _markSuccess,
          onMarkNeedsHelp: _markNeedsHelp,
          onPrevStep: _prevLearningStep,
          onReset: _resetLearningLoop,
          strings: strings,
        );
      case 4:
        return ProgressScreen(
          completedLoops: _completedLoops,
          currentTemplateTitle: _activeTemplate.title,
          currentStepLabel: currentStepLabel,
          successStreak: _successStreak,
          struggleStreak: _struggleStreak,
          recommendationText: _learningRecommendation(strings),
          recentEvents: _recentEvents.reversed.toList(),
          gameStars: _gameStars,
          gameBadges: _gameBadges,
          questProgress: _questProgress,
          strings: strings,
        );
      default:
        return ParentModeScreen(
          currentTemplateTitle: _activeTemplate.title,
          currentStepLabel: currentStepLabel,
          completedLoops: _completedLoops,
          hearingAssist: _profile.hearingAssist,
          visionAssist: _profile.visionAssist,
          lastUpdatedLabel: _lastUpdatedLabel,
          templates: _templates
              .map(
                (template) => ParentTemplateOption(
                  id: template.id,
                  title: template.title,
                ),
              )
              .toList(),
          selectedTemplateId: _activeTemplate.id,
          onTemplateChanged: _setActiveTemplate,
          selectedUiLanguageCode: _uiLanguageCode,
          onUiLanguageChanged: _setUiLanguage,
          strings: strings,
          onClearHistory: _clearHistory,
          onExportMarkdown: _exportMarkdown,
          onExportPdf: _exportPdf,
        );
    }
  }

  String get _lastUpdatedLabel {
    if (_lastUpdatedAt == null) {
      return 'Noch nicht gespeichert';
    }
    final local = _lastUpdatedAt!.toLocal();
    final dd = local.day.toString().padLeft(2, '0');
    final mm = local.month.toString().padLeft(2, '0');
    final yy = local.year.toString();
    final hh = local.hour.toString().padLeft(2, '0');
    final min = local.minute.toString().padLeft(2, '0');
    return '$dd.$mm.$yy $hh:$min';
  }

  String _learningRecommendation(AppStrings strings) {
    if (_adaptiveAssistHint || _struggleStreak >= 1) {
      return strings.recommendationSlow;
    }
    if (_successStreak >= 1) {
      return strings.recommendationFast;
    }
    return strings.recommendationDefault;
  }

  Future<void> _loadState() async {
    try {
      final seededTemplates = await _seedRepository.loadTemplatesOrFallback();
      final templates = seededTemplates.isEmpty ? kA1Templates : seededTemplates;

      await _progressStore.ensureSeeded(
        seedVersion: 'de-en-birkenbihl-v1',
        defaultTemplateId: templates.first.id,
      );

      final snapshot = await _progressStore.load(templates.first.id);
      final template = templates
              .where((candidate) => candidate.id == snapshot.templateId)
              .firstOrNull ??
          templates.first;
      final maxStepIndex = template.steps.length - 1;

      if (!mounted) {
        return;
      }

      setState(() {
        _profile = AssistiveProfile(
          hearingAssist: snapshot.hearingAssist,
          visionAssist: snapshot.visionAssist,
        );
        _templates = templates;
        _activeTemplate = template;
        _currentLearningStepIndex = snapshot.currentStepIndex.clamp(
          0,
          maxStepIndex,
        );
        _completedLoops = snapshot.completedLoops;
        _successStreak = snapshot.successStreak;
        _struggleStreak = snapshot.struggleStreak;
        _adaptiveAssistHint = snapshot.adaptiveAssistHint;
        _recentEvents = snapshot.recentEvents;
        _gameStars = snapshot.gameStars;
        _gameBadges = snapshot.gameBadges;
        _questProgress = snapshot.questProgress;
        if (snapshot.uiLanguageCode != null) {
          _uiLanguageCode = AppStrings.normalizeCode(snapshot.uiLanguageCode);
        }
        _setupCompleted = snapshot.setupCompleted;
        _selectedLanguage = snapshot.selectedLanguage;
        _selectedLevel = snapshot.selectedLevel;
        _selectedContext = snapshot.selectedContext;
        _lastUpdatedAt = snapshot.lastUpdatedAt;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _templates = kA1Templates;
        _activeTemplate = kA1Templates.first;
        _currentLearningStepIndex = 0;
        _setupCompleted = false;
        _isLoading = false;
      });
    }
  }

  ExerciseTemplate _templateById(String templateId) {
    return _templates
            .where((template) => template.id == templateId)
            .firstOrNull ??
        _templates.first;
  }

  void _markSuccess() {
    setState(() {
      _successStreak++;
      _struggleStreak = 0;
      _adaptiveAssistHint = false;
      _recordEvent('Geschafft');
      _grantGameReward(stars: 1);

      if (_successStreak >= 2) {
        _successStreak = 0;
        _advanceStep();
      }
    });
    _saveState();
  }

  void _markNeedsHelp() {
    setState(() {
      _struggleStreak++;
      _successStreak = 0;
      _recordEvent('Schwer');

      if (_struggleStreak >= 2) {
        _struggleStreak = 0;
        _adaptiveAssistHint = true;
        if (_currentLearningStepIndex > 0) {
          _currentLearningStepIndex--;
          _recordEvent('Schritt-zurueck');
        }
      }
    });
    _saveState();
  }

  void _advanceStep() {
    if (_currentLearningStepIndex < _activeTemplate.steps.length - 1) {
      _currentLearningStepIndex++;
      return;
    }

    _completedLoops++;
    _recordEvent('Loop-abgeschlossen');
    _currentLearningStepIndex = 0;
    _rotateTemplateAfterCompletedLoop();
  }

  void _rotateTemplateAfterCompletedLoop() {
    if (_templates.isEmpty) {
      return;
    }
    final nextIndex = _completedLoops % _templates.length;
    _activeTemplate = _templates[nextIndex];
    _adaptiveAssistHint = false;
  }

  void _prevLearningStep() {
    setState(() {
      if (_currentLearningStepIndex > 0) {
        _currentLearningStepIndex--;
      }
      _successStreak = 0;
      _struggleStreak = 0;
      _adaptiveAssistHint = false;
      _recordEvent('Manuell-zurueck');
    });
    _saveState();
  }

  void _resetLearningLoop() {
    setState(() {
      _currentLearningStepIndex = 0;
      _successStreak = 0;
      _struggleStreak = 0;
      _adaptiveAssistHint = false;
      _recordEvent('Loop-reset');
    });
    _saveState();
  }

  Future<String> _exportMarkdown() async {
    final now = DateTime.now();
    final file = await _exportService.exportMarkdown(_payload(now));
    return file.path;
  }

  Future<String> _exportPdf() async {
    final now = DateTime.now();
    final file = await _exportService.exportPdf(_payload(now));
    return file.path;
  }

  ExportPayload _payload(DateTime now) {
    return ExportPayload(
      templateTitle: _activeTemplate.title,
      currentStepLabel: _activeTemplate.steps[_currentLearningStepIndex]
          .labelFor(_uiLanguageCode),
      completedLoops: _completedLoops,
      hearingAssist: _profile.hearingAssist,
      visionAssist: _profile.visionAssist,
      successStreak: _successStreak,
      struggleStreak: _struggleStreak,
      recentEvents: _recentEvents.reversed.take(10).toList(),
      gameStars: _gameStars,
      gameBadges: _gameBadges,
      questProgress: _questProgress,
      selectedLanguage: _selectedLanguage,
      selectedLevel: _selectedLevel,
      selectedContext: _selectedContext,
      uiLanguageCode: _uiLanguageCode,
      generatedAt: now,
    );
  }

  Future<void> _saveState() async {
    final now = DateTime.now();
    _lastUpdatedAt = now;

    final snapshot = LearningAppStateSnapshot(
      hearingAssist: _profile.hearingAssist,
      visionAssist: _profile.visionAssist,
      templateId: _activeTemplate.id,
      currentStepIndex: _currentLearningStepIndex,
      completedLoops: _completedLoops,
      successStreak: _successStreak,
      struggleStreak: _struggleStreak,
      adaptiveAssistHint: _adaptiveAssistHint,
      recentEvents: _recentEvents,
      gameStars: _gameStars,
      gameBadges: _gameBadges,
      questProgress: _questProgress,
      setupCompleted: _setupCompleted,
      selectedLanguage: _selectedLanguage,
      selectedLevel: _selectedLevel,
      selectedContext: _selectedContext,
      uiLanguageCode: _uiLanguageCode,
      lastUpdatedAt: now,
    );

    await _progressStore.save(snapshot);

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  void _goToExercise() {
    if (!_setupCompleted) {
      return;
    }
    setState(() {
      _currentIndex = 3;
    });
  }

  void _finishSetup() {
    setState(() {
      _setupCompleted = true;
      _currentIndex = 3;
      _activeTemplate = _selectTemplateForContext();
      _currentLearningStepIndex = 0;
    });
    _recordEvent('Setup abgeschlossen');
    _saveState();
  }

  ExerciseTemplate _selectTemplateForContext() {
    final context = _selectedContext;
    if (context == 'school') {
      return _templateByContextKeyword('school');
    }
    if (context == 'family') {
      return _templateByContextKeyword('family');
    }
    if (context == 'travel') {
      return _templateByContextKeyword('travel');
    }
    return _activeTemplate;
  }

  ExerciseTemplate _templateByContextKeyword(String keyword) {
    final lower = keyword.toLowerCase();
    for (final template in _templates) {
      final id = template.id.toLowerCase();
      final title = template.title.toLowerCase();
      if (id.contains(lower) || title.contains(lower)) {
        return template;
      }
    }
    return _templates.first;
  }

  void _setActiveTemplate(String templateId) {
    final selected = _templateById(templateId);
    setState(() {
      _activeTemplate = selected;
      _currentLearningStepIndex = 0;
      _successStreak = 0;
      _struggleStreak = 0;
      _adaptiveAssistHint = false;
      _recordEvent('Template-gewechselt');
    });
    _saveState();
  }

  void _clearHistory() {
    setState(() {
      _recentEvents = const [];
    });
    _saveState();
  }

  void _setUiLanguage(String code) {
    setState(() {
      _uiLanguageCode = AppStrings.normalizeCode(code);
    });
    _saveState();
  }

  void _handleListeningRound(bool solved) {
    setState(() {
      _recordEvent(solved ? 'Hoer-Spiel richtig' : 'Hoer-Spiel falsch');
      if (solved) {
        _grantGameReward(stars: 2);
      }
    });
    _saveState();
  }

  void _handleSpeakingAttempt(bool good) {
    setState(() {
      _recordEvent(good ? 'Sprech-Spiel gelungen' : 'Sprech-Spiel nochmal');
      if (good) {
        _grantGameReward(stars: 2);
      }
    });
    _saveState();
  }

  void _grantGameReward({required int stars}) {
    _gameStars += stars;
    _questProgress++;
    if (_questProgress >= 5) {
      _questProgress = 0;
      _gameBadges++;
      _recordEvent('Tagesquest geschafft');
    }
  }

  void _recordEvent(String type) {
    final now = DateTime.now().toLocal();
    final hh = now.hour.toString().padLeft(2, '0');
    final min = now.minute.toString().padLeft(2, '0');
    final step = _activeTemplate.steps[_currentLearningStepIndex].labelFor(
      _uiLanguageCode,
    );
    final event = '$hh:$min | $type | ${_activeTemplate.title} | $step';
    final next = [..._recentEvents, event];
    const maxEvents = 40;
    if (next.length > maxEvents) {
      _recentEvents = next.sublist(next.length - maxEvents);
      return;
    }
    _recentEvents = next;
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull {
    if (isEmpty) {
      return null;
    }
    return first;
  }
}
