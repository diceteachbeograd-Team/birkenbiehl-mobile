enum LearningStep {
  decode,
  activeListen,
  passiveListen,
  activeResponse,
  transfer,
}

extension LearningStepLabel on LearningStep {
  String labelFor(String languageCode) {
    switch (languageCode) {
      case 'de':
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
      case 'es':
        switch (this) {
          case LearningStep.decode:
            return 'Entender palabras';
          case LearningStep.activeListen:
            return 'Escuchar atento';
          case LearningStep.passiveListen:
            return 'Escuchar tranquilo';
          case LearningStep.activeResponse:
            return 'Responder';
          case LearningStep.transfer:
            return 'Usar en la vida';
        }
      default:
        switch (this) {
          case LearningStep.decode:
            return 'Crack words';
          case LearningStep.activeListen:
            return 'Listen closely';
          case LearningStep.passiveListen:
            return 'Listen in background';
          case LearningStep.activeResponse:
            return 'Say it';
          case LearningStep.transfer:
            return 'Use in real life';
        }
    }
  }

  String hintFor(String languageCode) {
    switch (languageCode) {
      case 'de':
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
      case 'es':
        switch (this) {
          case LearningStep.decode:
            return 'Toca palabras y entiende el significado.';
          case LearningStep.activeListen:
            return 'Escucha y sigue la frase.';
          case LearningStep.passiveListen:
            return 'Deja la frase sonando en segundo plano.';
          case LearningStep.activeResponse:
            return 'Responde con tu voz.';
          case LearningStep.transfer:
            return 'Usa la frase en otra situacion.';
        }
      default:
        switch (this) {
          case LearningStep.decode:
            return 'Tap words and understand the meaning.';
          case LearningStep.activeListen:
            return 'Listen and follow the sentence.';
          case LearningStep.passiveListen:
            return 'Let the sentence play calmly in background.';
          case LearningStep.activeResponse:
            return 'Reply briefly with your voice.';
          case LearningStep.transfer:
            return 'Use the sentence in a new situation.';
        }
    }
  }
}
