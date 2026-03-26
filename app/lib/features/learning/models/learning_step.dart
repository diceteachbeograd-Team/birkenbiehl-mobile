enum LearningStep {
  decode,
  listen,
  speak,
  transfer,
}

extension LearningStepLabel on LearningStep {
  String get label {
    switch (this) {
      case LearningStep.decode:
        return 'Dekodieren';
      case LearningStep.listen:
        return 'Hoeren';
      case LearningStep.speak:
        return 'Antworten';
      case LearningStep.transfer:
        return 'Transfer';
    }
  }
}
