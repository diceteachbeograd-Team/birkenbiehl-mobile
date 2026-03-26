# Sprint 0 / Step 2: Subagent Todo (Aktualisiert)

## Ziel diese Woche
- GUI von der Demo auf produktnahe Lern-App heben.
- Birkenbihl-Lernloop sichtbar machen: Dekodieren -> Passiv hoeren -> Aktiv antworten -> Transfer.
- Inklusion und Kinderfreundlichkeit als Standard umsetzen.
- Alles so bauen, dass es auf 16-GB-Mac stabil entwickelt werden kann (ein Emulator, externe Caches).

## Was der Design-Agent mit Paedagogik-Expert sagt (Kern)
- Pro Screen nur eine Hauptaufgabe.
- Wenig Text, grosse klare Icons, hohe Kontraste.
- Fehler ohne Strafe, immer mit naechstem konkretem Schritt.
- Adaptiv nach Lerntempo und Lernpraeferenz (audio/visuell), aber manuell steuerbar.
- Accessibility ist Pflicht: Hoerhilfe, Sehhilfe, Screenreader und Braille-kompatible Semantik.
- Motivation ohne Dark Patterns: Fortschritt ja, Druck nein.

---

## Rolle: Mobile Core (Flutter)
- Aufgaben:
1. Kernscreens als eigene Widgets/Dateien trennen (`start`, `uebung`, `sprechen`, `verlauf`, `elternmodus`).
2. Bottom-Navigation und App-Shell auf diese Screens routen.
3. Lokales App-State-Modell fuer Assistive-Toggles und Lernmodus vorbereiten.
- Abhaengigkeiten: UX/Accessibility fuer Screenregeln; Learning Engine fuer Datenmodelle.
- Parallel: QA kann bereits Smoke-Tests auf Shell und Navigation fahren.
- Done: Navigation funktioniert stabil, jede Hauptansicht ist als eigene Datei angebunden.

## Rolle: Learning Engine
- Aufgaben:
1. Datenmodell fuer Lernloop-Schritt (`decode`, `listen`, `speak`, `transfer`) anlegen.
2. Erste 3 Template-Uebungen (A1) als lokale JSON-Struktur definieren.
3. Einfache adaptive Regel v0: bei 2 Fehlern mehr Wiederholung, bei 2 Erfolgen naechster Schritt.
- Abhaengigkeiten: Mobile Core fuer Anzeige; AI Runtime fuer spaetere STT/TTS-Anbindung.
- Parallel: UX kann mit Platzhalterdaten gestalten.
- Done: Ein kompletter Lernloop ist lokal simulierbar.

## Rolle: UX/Accessibility
- Aufgaben:
1. Screen-Spezifikation aus `DESIGN_PEDAGOGIK_GUI.md` auf reale UI-Widgets abbilden.
2. Hoerhilfe/Sehhilfe je Screen konkret definieren (was ändert sich sichtbar?).
3. Fokus-Reihenfolge und Screenreader-Labels fuer alle Hauptbuttons festlegen.
- Abhaengigkeiten: Mobile Core fuer Umsetzung.
- Parallel: QA erstellt Accessibility-Checkliste aus den Regeln.
- Done: Jede Hauptansicht hat klare UX-Regeln + Accessibility-Hinweise.

## Rolle: AI Runtime (vorbereitend)
- Aufgaben:
1. Schnittstellenvertrag v0 fuer STT/TTS festlegen (Input/Output-Modelle).
2. Stub-Service liefern, der fake Antworten fuer Sprech- und Hoer-Flow liefert.
- Abhaengigkeiten: Learning Engine (welche Lernschritte Daten brauchen).
- Parallel: Mobile Core kann UI damit testen, ohne echte Inferenz.
- Done: App kann mit Stub-Endpunkten den Lernfluss ohne Netzwerk durchspielen.

## Rolle: QA
- Aufgaben:
1. Testmatrix fuer diese Woche: Navigation, Lernloop, Accessibility-Toggles.
2. Widget-Tests fuer Screenwechsel und Hilfen (`hearing`, `vision`) erweitern.
3. Low-RAM-Workflow dokumentieren (nur ein Emulator aktiv).
- Abhaengigkeiten: Mobile Core und UX-Stand.
- Parallel: Release kann CI-Gates vorbereiten.
- Done: Testfaelle liegen im Repo und laufen lokal reproduzierbar.

## Rolle: Release/DevOps
- Aufgaben:
1. Build-Runbook fuer ressourcenschwache Maschinen dokumentieren (externe Caches/Temp).
2. CI-Workflow um Flutter Analyze + Test erweitern.
3. Branch/PR-Gate fuer UI- und Accessibility-Aenderungen festziehen.
- Abhaengigkeiten: QA (welche Tests Pflicht sind).
- Parallel: alle Teams koennen weiter implementieren.
- Done: Basis-CI prueft mindestens `flutter analyze` und `flutter test`.

---

## Parallelplan (token- und zeit-schonend)
- Parallelblock A:
1. Mobile Core: Screen-Trennung + Routing
2. Learning Engine: Loop-Modell + Templates
3. UX/Accessibility: konkrete Screenregeln

- Parallelblock B (nach A, aber ueberlappend moeglich):
1. AI Runtime: Stub-Vertrag
2. QA: Widget-Tests + Matrix
3. Release: CI-Update + Runbook

## Abnahme fuer Step 2
- Die App zeigt 5 Hauptscreens + Elternmodus in produktnaher Struktur.
- Ein A1-Lernloop ist Ende-zu-Ende sichtbar (mit Platzhalter-/Stubdaten).
- Hoerhilfe und Sehhilfe sind pro Ansicht schaltbar und testbar.
- `flutter analyze` und `flutter test` bleiben gruen.
