# Sprint 0 / Step 1: Subagent Todo

## Ziele
- Infrastruktur-Mindset: Baseline-Tooling + Kommunikation für Mobile, AI, Learning, UX, QA, Release.
- Klar definierte 1–2-Tagesaufgaben pro Rolle, inklusive Abhängigkeiten/parallel laufender Arbeiten und messbaren Done-Kriterien.

---

### Rolle: Mobile Core
- Aufgaben: (1) Komponentenverzeichnis inkl. State-Handling-Skizze aktualisieren; (2) Entwicklungs-Setup für natives Build + Emulator testen.
- Abhängigkeiten: Hardware/OS-Versionen von QA; UX-Zugriff auf finale Assets.
- Parallel läuft: AI Runtime beim Mock-API-Contract, Learning Engine beim Datenmodell.
- Done: Komponenten-Board up-to-date, `npm run ios`/`npm run android` startet ohne Fehlermeldung auf Referenzgerät, Dokumentation für Setup vorhanden.

### Rolle: AI Runtime
- Aufgaben: (1) API-Endpunkte für Prompt-Handling und Tokenverwaltung mocken; (2) aufgesetzt: Basic-Logik zur Auth/Rate-Limit-Simulation.
- Abhängigkeiten: Mobile Core für Hook-Aufrufe, QA zur Verifikation der Mock-Antworten.
- Parallel läuft: Learning Engine bei Evaluationsdaten, UX/Accessibility bei Dialog-Dialogfluss.
- Done: Mock-Server läuft lokal/in Container, contract.md mit Input/Output-Beispielen, Tests gegen Mobile Core-Mocks bestehen.

### Rolle: Learning Engine
- Aufgaben: (1) Datenstruktur für Personalization/Feedback beschreiben; (2) Skript zur Validierung von Trainingsbeispielen + Schnittstelle zu AI Runtime anlegen.
- Abhängigkeiten: AI Runtime für API-Shape, Mobile Core für Feedback-Trigger.
- Parallel läuft: QA bereitet Testdaten, Release plant Bundle-Strategie.
- Done: JSON-Schema + Beispiel-Sammlung bestehen, Validierungsscript lässt sich lokal starten, Integrationstest mit AI Runtime-Mock grünes Licht.

### Rolle: UX/Accessibility
- Aufgaben: (1) Sprint-Storyboards + Dialogfluss inkl. Fokus-Reihenfolge skizzieren; (2) Accessibility-Checklist für Sprint 0-Komponenten schreiben.
- Abhängigkeiten: Mobile Core für Layout-Limits, Learning Engine für Datenanzeige.
- Parallel läuft: AI Runtime beim Prompt-Flow, QA bei Kontrast-Tests.
- Done: Storyboards freigegeben, Fokus-Reihenfolge dokumentiert, Checkliste für Kontrast/Screenreader sichtbar und referenziert.

### Rolle: QA
- Aufgaben: (1) Testmatrix für Sprint 0 vorbereiten (Smoke/Integration/Accessibility); (2) Automatisierungsskelette für Beispielabläufe definieren.
- Abhängigkeiten: Mobile Core für Testfach, UX für kritische Pfade, Release für Tester-Umgebung.
- Parallel läuft: Mobile Core beim Build, Release beim Deployment-Plan.
- Done: Matrix + automatisierte Platzhaltertests in Repo, Kriterien und erwartete Ergebnisse dokumentiert, Setup-Guide existiert.

### Rolle: Release
- Aufgaben: (1) Env- und Build-Checklist für Sprint 0 definieren; (2) Deployment-Channel + Kommunikationsplan (Stakeholder/Milestone) skizzieren.
- Abhängigkeiten: Mobile Core/QA für Build-Stabilität, AI Runtime für Runtime-Abhängigkeiten.
- Parallel läuft: QA Testläufe, Learning Engine-Datenbereitstellung.
- Done: Checklisten+Plan versioniert im Repo, Verantwortlichkeiten klar, Stakeholder-Update terminiert.
