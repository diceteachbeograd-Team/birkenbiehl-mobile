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
        );
    }
  }
}
