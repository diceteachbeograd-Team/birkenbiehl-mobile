class AppStrings {
  const AppStrings({
    required this.appTitle,
    required this.tabStart,
    required this.tabSpeaking,
    required this.tabListening,
    required this.tabExercise,
    required this.tabProgress,
    required this.tabParent,
    required this.setupTitle,
    required this.setupSubtitle,
    required this.setupStepLanguage,
    required this.setupStepLevel,
    required this.setupStepContext,
    required this.setupFinish,
    required this.parentTitle,
    required this.parentSubtitle,
    required this.parentUiLanguage,
    required this.parentUiLanguageLabel,
    required this.languageGerman,
    required this.languageEnglish,
    required this.languageSpanish,
    required this.startTodayText,
    required this.startNextTask,
    required this.startLearningLoop,
    required this.startCurrent,
    required this.startCompletedLoops,
    required this.startGameStars,
    required this.startBadges,
    required this.startDailyQuest,
    required this.startHelpActive,
    required this.startRecommendation,
    required this.exerciseNow,
    required this.exerciseSupport,
    required this.exerciseTipEnabled,
    required this.exerciseTipText,
    required this.exerciseBack,
    required this.exerciseReset,
    required this.exerciseTooHard,
    required this.exerciseDone,
    required this.listeningTitle,
    required this.listeningRound,
    required this.listeningSolved,
    required this.listeningPlayAudio,
    required this.listeningCorrect,
    required this.listeningAlmost,
    required this.listeningCorrectHint,
    required this.listeningWrongHint,
    required this.listeningRestart,
    required this.listeningNext,
    required this.speakingTitle,
    required this.speakingStickers,
    required this.speakingTask,
    required this.speakingStop,
    required this.speakingStart,
    required this.speakingRecording,
    required this.speakingRecordingHint,
    required this.speakingWorked,
    required this.speakingRetry,
    required this.progressCurrentExercise,
    required this.progressCurrentStep,
    required this.progressCompletedLoops,
    required this.progressGameStars,
    required this.progressBadges,
    required this.progressQuest,
    required this.progressSuccessSeries,
    required this.progressHelpSeries,
    required this.progressSaved,
    required this.progressRecentActions,
    required this.progressNoActions,
  });

  final String appTitle;
  final String tabStart;
  final String tabSpeaking;
  final String tabListening;
  final String tabExercise;
  final String tabProgress;
  final String tabParent;

  final String setupTitle;
  final String setupSubtitle;
  final String setupStepLanguage;
  final String setupStepLevel;
  final String setupStepContext;
  final String setupFinish;

  final String parentTitle;
  final String parentSubtitle;
  final String parentUiLanguage;
  final String parentUiLanguageLabel;

  final String languageGerman;
  final String languageEnglish;
  final String languageSpanish;

  final String startTodayText;
  final String startNextTask;
  final String startLearningLoop;
  final String startCurrent;
  final String startCompletedLoops;
  final String startGameStars;
  final String startBadges;
  final String startDailyQuest;
  final String startHelpActive;
  final String startRecommendation;

  final String exerciseNow;
  final String exerciseSupport;
  final String exerciseTipEnabled;
  final String exerciseTipText;
  final String exerciseBack;
  final String exerciseReset;
  final String exerciseTooHard;
  final String exerciseDone;

  final String listeningTitle;
  final String listeningRound;
  final String listeningSolved;
  final String listeningPlayAudio;
  final String listeningCorrect;
  final String listeningAlmost;
  final String listeningCorrectHint;
  final String listeningWrongHint;
  final String listeningRestart;
  final String listeningNext;

  final String speakingTitle;
  final String speakingStickers;
  final String speakingTask;
  final String speakingStop;
  final String speakingStart;
  final String speakingRecording;
  final String speakingRecordingHint;
  final String speakingWorked;
  final String speakingRetry;

  final String progressCurrentExercise;
  final String progressCurrentStep;
  final String progressCompletedLoops;
  final String progressGameStars;
  final String progressBadges;
  final String progressQuest;
  final String progressSuccessSeries;
  final String progressHelpSeries;
  final String progressSaved;
  final String progressRecentActions;
  final String progressNoActions;

  static const supportedCodes = ['de', 'en', 'es'];

  static String normalizeCode(String? code) {
    if (code == null) {
      return 'en';
    }
    if (supportedCodes.contains(code)) {
      return code;
    }
    if (code.startsWith('de')) {
      return 'de';
    }
    if (code.startsWith('es')) {
      return 'es';
    }
    return 'en';
  }

  static AppStrings fromCode(String code) {
    switch (normalizeCode(code)) {
      case 'de':
        return const AppStrings(
          appTitle: 'Birkenbiehl Mobile',
          tabStart: 'Start',
          tabSpeaking: 'Sprechen',
          tabListening: 'Hoeren',
          tabExercise: 'Lernspiel',
          tabProgress: 'Verlauf',
          tabParent: 'Eltern',
          setupTitle: 'Lernstart',
          setupSubtitle:
              'Wir richten dein Lernspiel in 3 kurzen Schritten ein.',
          setupStepLanguage: '1. Welche Sprache lernst du?',
          setupStepLevel: '2. Wie startest du am besten?',
          setupStepContext: '3. Worum willst du sprechen?',
          setupFinish: 'Los gehts',
          parentTitle: 'Elternmodus',
          parentSubtitle: 'Einstellungen, Lernstand und Exporte verwalten.',
          parentUiLanguage: 'Startsprache der App',
          parentUiLanguageLabel: 'App-Sprache',
          languageGerman: 'Deutsch',
          languageEnglish: 'Englisch',
          languageSpanish: 'Spanisch',
          startTodayText:
              'Heute: 3 kurze Schritte bis zur ersten sicheren Antwort.',
          startNextTask: 'Naechste Aufgabe starten',
          startLearningLoop: 'Birkenbihl-Lernloop',
          startCurrent: 'Aktuell',
          startCompletedLoops: 'Abgeschlossene Loops',
          startGameStars: 'Spielsterne',
          startBadges: 'Abzeichen',
          startDailyQuest: 'Tagesquest',
          startHelpActive: 'Hilfen aktiv',
          startRecommendation: 'Empfohlener naechster Schritt',
          exerciseNow: 'Jetzt',
          exerciseSupport: 'Lernhilfe v0',
          exerciseTipEnabled: 'Tipp aktiviert',
          exerciseTipText:
              'Wir bleiben kurz im einfacheren Schritt mit mehr Hilfe.',
          exerciseBack: 'Zurueck',
          exerciseReset: 'Neu',
          exerciseTooHard: 'Schwer',
          exerciseDone: 'Geschafft',
          listeningTitle: 'Hoeren Spiel',
          listeningRound: 'Runde',
          listeningSolved: 'Lokal geloest',
          listeningPlayAudio: 'Audio abspielen',
          listeningCorrect: 'Richtig gehoert',
          listeningAlmost: 'Fast! Noch mal hoeren.',
          listeningCorrectHint: 'Sehr gut. Du bekommst einen Stern.',
          listeningWrongHint: 'Tip: Audio 1-2x nochmal starten.',
          listeningRestart: 'Spiel neu starten',
          listeningNext: 'Naechste Runde',
          speakingTitle: 'Sprechen Spiel',
          speakingStickers: 'Sticker verdient',
          speakingTask: 'Aufgabe',
          speakingStop: 'Aufnahme stoppen',
          speakingStart: 'Aufnahme starten',
          speakingRecording: 'Aufnahme laeuft',
          speakingRecordingHint: 'Sprich den Satz in deinem Tempo nach.',
          speakingWorked: 'Hat geklappt',
          speakingRetry: 'Nochmal',
          progressCurrentExercise: 'Aktuelle Uebung',
          progressCurrentStep: 'Aktueller Schritt',
          progressCompletedLoops: 'Abgeschlossene Loops',
          progressGameStars: 'Spielsterne',
          progressBadges: 'Abzeichen',
          progressQuest: 'Quest-Fortschritt',
          progressSuccessSeries: 'Erfolgsserie',
          progressHelpSeries: 'Hilfeserie',
          progressSaved: 'Fortschritt wird lokal gespeichert',
          progressRecentActions: 'Letzte Lernaktionen',
          progressNoActions: 'Noch keine Lernaktionen gespeichert',
        );
      case 'es':
        return const AppStrings(
          appTitle: 'Birkenbiehl Mobile',
          tabStart: 'Inicio',
          tabSpeaking: 'Hablar',
          tabListening: 'Escuchar',
          tabExercise: 'Juego',
          tabProgress: 'Progreso',
          tabParent: 'Familia',
          setupTitle: 'Inicio de aprendizaje',
          setupSubtitle: 'Preparamos tu juego en 3 pasos cortos.',
          setupStepLanguage: '1. Que idioma aprendes?',
          setupStepLevel: '2. Como quieres empezar?',
          setupStepContext: '3. De que quieres hablar?',
          setupFinish: 'Empezar',
          parentTitle: 'Modo familia',
          parentSubtitle: 'Gestionar ajustes, progreso y exportaciones.',
          parentUiLanguage: 'Idioma inicial de la app',
          parentUiLanguageLabel: 'Idioma de la app',
          languageGerman: 'Aleman',
          languageEnglish: 'Ingles',
          languageSpanish: 'Espanol',
          startTodayText: 'Hoy: 3 pasos cortos para responder con seguridad.',
          startNextTask: 'Empezar siguiente tarea',
          startLearningLoop: 'Ciclo Birkenbiehl',
          startCurrent: 'Ahora',
          startCompletedLoops: 'Ciclos completados',
          startGameStars: 'Estrellas',
          startBadges: 'Insignias',
          startDailyQuest: 'Mision diaria',
          startHelpActive: 'Ayudas activas',
          startRecommendation: 'Siguiente paso recomendado',
          exerciseNow: 'Ahora',
          exerciseSupport: 'Ayuda de aprendizaje',
          exerciseTipEnabled: 'Consejo activo',
          exerciseTipText: 'Seguimos un paso mas facil con mas ayuda.',
          exerciseBack: 'Atras',
          exerciseReset: 'Reiniciar',
          exerciseTooHard: 'Dificil',
          exerciseDone: 'Hecho',
          listeningTitle: 'Juego de escuchar',
          listeningRound: 'Ronda',
          listeningSolved: 'Resueltas',
          listeningPlayAudio: 'Reproducir audio',
          listeningCorrect: 'Correcto',
          listeningAlmost: 'Casi! Escucha otra vez.',
          listeningCorrectHint: 'Muy bien. Ganas una estrella.',
          listeningWrongHint: 'Tip: reproduce el audio 1-2 veces.',
          listeningRestart: 'Reiniciar juego',
          listeningNext: 'Siguiente ronda',
          speakingTitle: 'Juego de hablar',
          speakingStickers: 'Pegatinas',
          speakingTask: 'Tarea',
          speakingStop: 'Parar grabacion',
          speakingStart: 'Iniciar grabacion',
          speakingRecording: 'Grabando',
          speakingRecordingHint: 'Repite la frase a tu ritmo.',
          speakingWorked: 'Me salio bien',
          speakingRetry: 'Otra vez',
          progressCurrentExercise: 'Ejercicio actual',
          progressCurrentStep: 'Paso actual',
          progressCompletedLoops: 'Ciclos completados',
          progressGameStars: 'Estrellas',
          progressBadges: 'Insignias',
          progressQuest: 'Progreso de mision',
          progressSuccessSeries: 'Racha de aciertos',
          progressHelpSeries: 'Racha de ayuda',
          progressSaved: 'El progreso se guarda localmente',
          progressRecentActions: 'Ultimas acciones',
          progressNoActions: 'Aun no hay acciones guardadas',
        );
      default:
        return const AppStrings(
          appTitle: 'Birkenbiehl Mobile',
          tabStart: 'Start',
          tabSpeaking: 'Speak',
          tabListening: 'Listen',
          tabExercise: 'Learning Game',
          tabProgress: 'Progress',
          tabParent: 'Parents',
          setupTitle: 'Learning Setup',
          setupSubtitle: 'Let us prepare your game in 3 short steps.',
          setupStepLanguage: '1. Which language do you learn?',
          setupStepLevel: '2. How do you want to start?',
          setupStepContext: '3. What do you want to talk about?',
          setupFinish: 'Start now',
          parentTitle: 'Parent Mode',
          parentSubtitle: 'Manage settings, progress and exports.',
          parentUiLanguage: 'App startup language',
          parentUiLanguageLabel: 'App language',
          languageGerman: 'German',
          languageEnglish: 'English',
          languageSpanish: 'Spanish',
          startTodayText: 'Today: 3 short steps to your first safe answer.',
          startNextTask: 'Start next task',
          startLearningLoop: 'Birkenbiehl learning loop',
          startCurrent: 'Current',
          startCompletedLoops: 'Completed loops',
          startGameStars: 'Game stars',
          startBadges: 'Badges',
          startDailyQuest: 'Daily quest',
          startHelpActive: 'Active supports',
          startRecommendation: 'Recommended next step',
          exerciseNow: 'Now',
          exerciseSupport: 'Learning support',
          exerciseTipEnabled: 'Tip active',
          exerciseTipText: 'We stay in an easier step with more support.',
          exerciseBack: 'Back',
          exerciseReset: 'Reset',
          exerciseTooHard: 'Too hard',
          exerciseDone: 'Done',
          listeningTitle: 'Listening game',
          listeningRound: 'Round',
          listeningSolved: 'Solved locally',
          listeningPlayAudio: 'Play audio',
          listeningCorrect: 'Correct listening',
          listeningAlmost: 'Almost! Listen again.',
          listeningCorrectHint: 'Great. You earn one star.',
          listeningWrongHint: 'Tip: replay audio 1-2 times.',
          listeningRestart: 'Restart game',
          listeningNext: 'Next round',
          speakingTitle: 'Speaking game',
          speakingStickers: 'Stickers earned',
          speakingTask: 'Task',
          speakingStop: 'Stop recording',
          speakingStart: 'Start recording',
          speakingRecording: 'Recording running',
          speakingRecordingHint: 'Repeat the sentence at your own pace.',
          speakingWorked: 'It worked',
          speakingRetry: 'Try again',
          progressCurrentExercise: 'Current exercise',
          progressCurrentStep: 'Current step',
          progressCompletedLoops: 'Completed loops',
          progressGameStars: 'Game stars',
          progressBadges: 'Badges',
          progressQuest: 'Quest progress',
          progressSuccessSeries: 'Success streak',
          progressHelpSeries: 'Help streak',
          progressSaved: 'Progress is stored locally',
          progressRecentActions: 'Recent learning actions',
          progressNoActions: 'No learning actions saved yet',
        );
    }
  }
}
