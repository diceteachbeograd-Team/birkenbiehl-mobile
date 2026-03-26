# Sprint 1: Subagent Plan (Parallel, Tokenschonend)

## Sprintziel

Ein lauffaehiger MVP-Kern mit Birkenbihl-Lernloop, kindgerechter UI und offline Lernstand.

## Teamaufteilung mit Modellwahl

1. Agent `mobile_core`
- Modell: `gpt-5.4`
- Verantwortung: Flutter Screen-Flow, Navigation, State-Wiring
- Grund: mittlere bis hohe Code-Komplexitaet auf kritischem Pfad

2. Agent `learning_engine`
- Modell: `gpt-5.4`
- Verantwortung: Lernschritt-Logik, Template-Engine, Adaptionsregeln v0
- Grund: inhaltlich-kritische Logik mit Regression-Risiko

3. Agent `ux_a11y`
- Modell: `gpt-5.4-mini`
- Verantwortung: UI-Regeln auf Widgets abbilden, Accessibility-Semantik, Fokusreihenfolge
- Grund: viele klare Teilaufgaben, gut mini-geeignet

4. Agent `qa_guard`
- Modell: `gpt-5.4-mini`
- Verantwortung: Widget-Tests, Smoke-Tests, Low-RAM-Runbook-Checks
- Grund: strukturiertes, wiederholbares Testen

5. Agent `release_ci`
- Modell: `gpt-5.4-mini`
- Verantwortung: CI-Gates, Analyze/Test Pflichtchecks, Build-Doku
- Grund: standardisierte Pipeline-Aufgaben

6. Agent `content_seed`
- Modell: `gpt-5.4-mini`
- Verantwortung: A1-Starterinhalte (10-20 Templates), kindgerechte Prompt-Varianten
- Grund: klare Strukturarbeit, token-effizient mini

## Parallelblock A (Tag 1-2)

1. `mobile_core`
- App-Shell stabilisieren
- Lernloop-Steuerung zentral im State
- Screen-Parameter pro Lernschritt sauber durchreichen

2. `learning_engine`
- Datenmodell fuer `decode/listen/respond/transfer`
- Persistenter Fortschritt pro Einheit
- Adaptionsregel v0 implementieren

3. `ux_a11y`
- Semantics-Labels auf Hauptaktionen
- grosse Touch-Ziele + Kontrastregeln
- Icon+Text-Dualitaet auf Kernscreens

Abnahme Block A:
- Lernloop laeuft ohne Internet
- UI ist von Kindern in 1-3 Schritten bedienbar
- Assistive Basisfunktionen sind aktiv

## Parallelblock B (Tag 2-3)

1. `content_seed`
- A1-Basispaket in JSON/YAML definieren
- je Template: Chunks, Audio-Referenz, Transfer-Impuls

2. `qa_guard`
- Widget-Tests fuer Lernschrittwechsel
- Tests fuer Assistive-Toggles und Navigation
- Smoke-Protokoll fuer nur einen Emulator

3. `release_ci`
- CI: `flutter analyze` + `flutter test`
- PR-Checkliste fuer A11y und Offline-Flow

Abnahme Block B:
- 10-20 Templates lokal nutzbar
- Kern-Tests laufen gruen
- CI blockt fehlerhafte PRs

## Parallelblock C (Tag 4-5)

1. `mobile_core`
- Elternmodus light anbinden
- Verlaufsansicht mit Lernschritt-Historie

2. `learning_engine`
- lokale Metriken: Erfolgsquote, Wiederholungen, Transferquote
- einfache Empfehlung naechster Schritt

3. `qa_guard`
- Regressionstest vor Release-Tag
- manuelle A11y-Pruefung (VoiceOver/TalkBack Basis)

Abnahme Block C:
- Eltern sehen sinnvolle Fortschrittsdaten
- Kind erlebt einen konsistenten Lernpfad
- Releasekandidat technisch stabil

## Uebergabeformat zwischen Agenten

Jeder Agent liefert pro Arbeitspaket:
- geaenderte Dateien
- kurze Risiko-Liste
- offene Abhaengigkeiten
- Testnachweis (falls vorhanden)

## No-Go Kriterien im Sprint

- Neue Features ohne Birkenbihl-Bezug
- UI-Spielereien mit Ablenkungsrisiko
- Netzwerkzwang fuer Kernlernen
- ungetestete Accessibility-Aenderungen

## Sprint-Exit-Kriterien

- Lernloop Ende-zu-Ende funktionsfaehig
- A1-Starterinhalte offline vorhanden
- Basis-Adaptionslogik aktiv
- Analyze/Test gruen in CI
- Elternmodus light vorhanden
