import 'package:flutter/material.dart';

import 'core/models/assistive_profile.dart';
import 'features/exercises/exercises_screen.dart';
import 'features/learning/models/exercise_template.dart';
import 'features/learning/models/learning_step.dart';
import 'features/listening/listening_screen.dart';
import 'features/parent/parent_mode_screen.dart';
import 'features/progress/progress_screen.dart';
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

  int _currentIndex = 0;
  bool _isLoading = true;

  AssistiveProfile _profile = const AssistiveProfile(
    hearingAssist: false,
    visionAssist: false,
  );

  ExerciseTemplate _activeTemplate = kA1Templates.first;
  int _currentLearningStepIndex = 0;
  int _completedLoops = 0;
  int _successStreak = 0;
  int _struggleStreak = 0;
  bool _adaptiveAssistHint = false;
  DateTime? _lastUpdatedAt;

  static const List<({String label, IconData icon})> _tabs = [
    (label: 'Start', icon: Icons.home_rounded),
    (label: 'Sprechen', icon: Icons.mic_rounded),
    (label: 'Hoeren', icon: Icons.volume_up_rounded),
    (label: 'Uebung', icon: Icons.extension_rounded),
    (label: 'Verlauf', icon: Icons.menu_book_rounded),
    (label: 'Eltern', icon: Icons.admin_panel_settings_rounded),
  ];

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  @override
  Widget build(BuildContext context) {
    final currentStepLabel =
        _activeTemplate.steps[_currentLearningStepIndex].label;

    return Scaffold(
      appBar: AppBar(title: const Text('Birkenbiehl Mobile')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _buildScreen(currentStepLabel)),
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
        items: _tabs
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

  Widget _buildScreen(String currentStepLabel) {
    switch (_currentIndex) {
      case 0:
        return StartScreen(
          profile: _profile,
          currentStepLabel: currentStepLabel,
          completedLoops: _completedLoops,
          recommendationText: _learningRecommendation,
          onStartLearning: _goToExercise,
        );
      case 1:
        return const SpeakingScreen();
      case 2:
        return const ListeningScreen();
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
        );
      case 4:
        return ProgressScreen(
          completedLoops: _completedLoops,
          currentTemplateTitle: _activeTemplate.title,
          currentStepLabel: currentStepLabel,
          successStreak: _successStreak,
          struggleStreak: _struggleStreak,
          recommendationText: _learningRecommendation,
        );
      default:
        return ParentModeScreen(
          currentTemplateTitle: _activeTemplate.title,
          currentStepLabel: currentStepLabel,
          completedLoops: _completedLoops,
          hearingAssist: _profile.hearingAssist,
          visionAssist: _profile.visionAssist,
          lastUpdatedLabel: _lastUpdatedLabel,
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

  String get _learningRecommendation {
    if (_adaptiveAssistHint || _struggleStreak >= 1) {
      return 'Langsamer bleiben: erst Dekodieren und Hoeren wiederholen.';
    }
    if (_successStreak >= 1) {
      return 'Guter Lauf: einen Schritt weiter und dann direkt Transfer testen.';
    }
    return 'Kurze Hoerphase starten und danach mit Geschafft/Schwer bewerten.';
  }

  Future<void> _loadState() async {
    final snapshot = await _progressStore.load(kA1Templates.first.id);
    final template = _templateById(snapshot.templateId);
    final maxStepIndex = template.steps.length - 1;

    if (!mounted) {
      return;
    }

    setState(() {
      _profile = AssistiveProfile(
        hearingAssist: snapshot.hearingAssist,
        visionAssist: snapshot.visionAssist,
      );
      _activeTemplate = template;
      _currentLearningStepIndex = snapshot.currentStepIndex.clamp(
        0,
        maxStepIndex,
      );
      _completedLoops = snapshot.completedLoops;
      _successStreak = snapshot.successStreak;
      _struggleStreak = snapshot.struggleStreak;
      _adaptiveAssistHint = snapshot.adaptiveAssistHint;
      _lastUpdatedAt = snapshot.lastUpdatedAt;
      _isLoading = false;
    });
  }

  ExerciseTemplate _templateById(String templateId) {
    return kA1Templates
            .where((template) => template.id == templateId)
            .firstOrNull ??
        kA1Templates.first;
  }

  void _markSuccess() {
    setState(() {
      _successStreak++;
      _struggleStreak = 0;
      _adaptiveAssistHint = false;

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

      if (_struggleStreak >= 2) {
        _struggleStreak = 0;
        _adaptiveAssistHint = true;
        if (_currentLearningStepIndex > 0) {
          _currentLearningStepIndex--;
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
    _currentLearningStepIndex = 0;
    _rotateTemplateAfterCompletedLoop();
  }

  void _rotateTemplateAfterCompletedLoop() {
    if (kA1Templates.isEmpty) {
      return;
    }
    final nextIndex = _completedLoops % kA1Templates.length;
    _activeTemplate = kA1Templates[nextIndex];
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
    });
    _saveState();
  }

  void _resetLearningLoop() {
    setState(() {
      _currentLearningStepIndex = 0;
      _successStreak = 0;
      _struggleStreak = 0;
      _adaptiveAssistHint = false;
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
      currentStepLabel: _activeTemplate.steps[_currentLearningStepIndex].label,
      completedLoops: _completedLoops,
      hearingAssist: _profile.hearingAssist,
      visionAssist: _profile.visionAssist,
      successStreak: _successStreak,
      struggleStreak: _struggleStreak,
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
      lastUpdatedAt: now,
    );

    await _progressStore.save(snapshot);

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  void _goToExercise() {
    setState(() {
      _currentIndex = 3;
    });
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
