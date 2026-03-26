# Tech Foundation

Diese Doku beschreibt den aktuellen technischen Ausgangspunkt fuer die spaetere Flutter-App.

## Status heute

- Flutter CLI ist hier nicht verfuegbar.
- Das Repo enthaelt nur ein code-nahes Skeleton.
- Die Zielstruktur liegt unter `app/lib` und `app/tests`.

## Zielstruktur

- `app/lib/core` fuer app-weite technische Grundlagen
- `app/lib/features` fuer fachliche App-Bereiche
- `app/lib/platform` fuer plattformspezifische Integrationen
- `app/lib/shared` fuer wiederverwendbare Bausteine
- `app/tests` fuer Test-Placeholder

## Naechste Schritte sobald Flutter installiert ist

1. Flutter verifizieren:
   - `flutter doctor`
2. App-Root initialisieren:
   - im Ordner `app/` `flutter create --platforms=android,ios,web .` ausfuehren
3. Projektkonfiguration ergaenzen:
   - `pubspec.yaml`
   - `analysis_options.yaml`
   - `lib/main.dart`
4. Vorhandene Struktur mit dem erzeugten Flutter-Projekt abgleichen:
   - `lib/core`
   - `lib/features`
   - `lib/platform`
   - `lib/shared`
   - `tests` oder spaeter optional `test`, je nach Teamkonvention
5. Erstes technisches Smoke-Test-Set ausfuehren:
   - `flutter pub get`
   - `flutter test`
   - optional `flutter run`

## Leitplanken

- Business-Logik bleibt aus `platform` heraus.
- Geteilte Helfer kommen in `shared`, nicht in einzelne Features.
- `core` bleibt fuer app-weite Grundlagen reserviert.
- Erst echte Bedarfe ergaenzen, dann Pakete oder Architekturschichten hinzufuegen.
