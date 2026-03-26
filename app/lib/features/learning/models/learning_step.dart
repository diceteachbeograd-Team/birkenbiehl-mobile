enum LearningStep {
  decode,
  activeListen,
  passiveListen,
  activeResponse,
  transfer,
}

extension LearningStepLabel on LearningStep {
  String get label {
    switch (this) {
      case LearningStep.decode:
        return 'Wort knacken';
      case LearningStep.activeListen:
        return 'Genau hoeren';
      case LearningStep.passiveListen:
        return 'Nebenbei hoeren';
      case LearningStep.activeResponse:
        return 'Selber sagen';
      case LearningStep.transfer:
        return 'Im Alltag nutzen';
    }
  }

  String get hint {
    switch (this) {
      case LearningStep.decode:
        return 'Tippe auf Woerter und verstehe die Bedeutung.';
      case LearningStep.activeListen:
        return 'Hoere zu und folge dem Satz.';
      case LearningStep.passiveListen:
        return 'Lass den Satz ruhig nebenbei laufen.';
      case LearningStep.activeResponse:
        return 'Antworte kurz mit deiner Stimme.';
      case LearningStep.transfer:
        return 'Nutze den Satz in einer neuen Situation.';
    }
  }
}
