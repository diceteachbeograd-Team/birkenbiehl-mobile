# MVP Paedagogik Blueprint (Birkenbihl -> B1 Sprechfokus)

## 1. Produktziel

Die App fuehrt Lernende ueberschaubar und kindgerecht von A0/A1 in Richtung A2 und spaeter B1.
Im MVP liegt der Schwerpunkt auf:
- Verstehen und Antworten in der Fremdsprache
- Sprechmut und Sprechroutine
- Offline-Nutzbarkeit auf Mobilgeraeten

Schreiben bleibt im MVP nachrangig.

## 2. Zielgruppe und Leitplanken

Kernzielgruppe:
- Kinder 6-7 Jahre

Sekundaere Zielgruppe:
- Aeltere Lernende mit gleicher Lernlogik

Leitplanken:
- Kein Druck, keine Ranglisten, keine manipulativen Streaks
- Fehler = Lernsignal, nicht Bestrafung
- Eltern-/Lehrkraft-Ansicht getrennt vom Kinderfluss
- Datensparsam und offline-first

## 3. Lernarchitektur (Stufen)

- A0: Klang, Basissignale, Verstehen ueber Bild+Audio
- A1: Einfache Reaktion in Wortgruppen und Mini-Saetzen
- A2: Kurzdialoge, Story-Muster, Kontextwechsel
- B1 (Langfristziel): alltagsnahe Selbststaendigkeit im Verstehen und Sprechen

Wichtig:
- B1 ist fuer 6-7 Jaehige ein mehrjaehriger Pfad.
- Das MVP muss die richtige Methodik bauen, nicht B1 in kurzer Zeit versprechen.

## 4. Birkenbihl-Lernloop als Kern-Engine

Jede Lerneinheit folgt immer denselben 4 Schritten:

1. Dekodieren
- Sprachmaterial in Sinnbausteine zerlegen
- Bedeutung klar machen (Bild, einfache Erklaerung, Audiosegment)

2. Passiv hoeren
- mehrfache, entspannte Exposition ohne Antwortdruck
- mit optionaler visueller Mitfuehrung

3. Aktiv antworten
- kurze, eindeutige Interaktion
- z. B. Auswahl, Zuordnung, Nachsprechen, Ja/Nein

4. Transfer
- gleiche Struktur in neuer Situation anwenden
- Mini-Rollenspiel oder alltagsnahe Impulsfrage

Definition of done pro Einheit:
- Alle 4 Schritte einmal erfolgreich abgeschlossen
- Lernstand lokal gespeichert

## 5. Uebungstypen im MVP

Dekodieren:
- Wort-Bild-Zuordnung
- Satz in 2-4 Chunks tippen

Passiv hoeren:
- Audio-Loop mit langsamer/normaler Geschwindigkeit
- optionales Mitlesen einzelner Chunks

Aktiv antworten:
- 2-3 Antwortoptionen
- Bild nach Audio waehlen
- Nachsprechen (erst ohne harte Bewertung)

Transfer:
- Kontextwechsel mit gleichem Sprachmuster
- Mini-Frage auf neues Bild/Objekt

## 6. Adaptive Logik v0 (einfach, robust, offline)

Eingangssignale:
- Fehlerzahl pro Schritt
- Reaktionszeit
- Wiederholungsnutzung
- Audiohilfe-Nutzung

Regeln v0:
- 2 Fehler in Folge -> ein Schritt zurueck oder Hilfsmodus aktivieren
- 2 korrekte Antworten in Folge -> normaler Fortschritt
- hohe Antwortlatenz -> mehr Dekodierhilfe anzeigen
- haeufige Audiohilfe -> Audio-zentrierte Darstellung bevorzugen

Alle Regeln lokal speicherbar (kein Cloud-Zwang).

## 7. Motivation (spielerisch, ethisch)

Im MVP erlaubt:
- sichtbarer Fortschrittspfad
- positive Sofort-Rueckmeldung
- kleine Sammelobjekte (rein kosmetisch)
- Kapitel-Freischaltung ueber Lernkompetenz

Im MVP ausgeschlossen:
- Verluststrafe
- soziale Ranglisten fuer Kinder
- taeglicher Druck durch Streak-Verlust
- manipulative Kaufanreize im Kinderfluss

## 8. Accessibility und Inklusion im MVP

Pflichtumfang:
- getrennte Seh- und Hoerhilfen als individuelle Toggles
- klare Screenreader-Semantik und Fokusreihenfolge
- hohe Kontraste, grosse Klickflaechen
- jede icon-basierte Aktion hat textliche Entsprechung

Zusaetzlich vorbereiten:
- Braille-kompatible, lineare Bedienlogik
- VoiceOver/TalkBack und externe Braille-Displays testbar halten

## 9. Messgroessen (Lernwirksamkeit statt Vanity)

MVP KPIs:
- Verstehensquote bei Hoerimpulsen
- Erfolgsquote beim aktiven Antworten
- Transferquote in neuem Kontext
- Wiederholungen bis sichere Antwort
- Retention nach 3/7/14 Tagen

Nicht als Hauptziel:
- reine App-Zeit
- Login-Haeufigkeit ohne Lernfortschritt

## 10. MVP Scope fuer Sprint 1-2

Sprint 1:
- Lernloop-End-to-End mit lokaler Speicherung
- 1 Sprachpaket (A1-Starter), 10-20 Templates
- kindgerechte 5-Screen-Navigation
- Basis-Accessibility aktiviert

Sprint 2:
- Adaptive Regeln v0 produktiv
- Elternmodus light (Einstellungen + Fortschrittsblick)
- Export von Konversations-/Lernverlauf als `.md` und `.pdf`
- QA-Basis fuer VoiceOver/TalkBack und Low-RAM-Workflows

## 11. Architekturentscheidungen (MVP)

- Flutter als gemeinsame iOS/Android-Basis
- lokale Datenhaltung zuerst (z. B. Hive/Isar/SQLite)
- STT/TTS/Translator initial ueber austauschbare Interfaces
- echte Modelle spaeter schrittweise, ohne UI-Neubau

## 12. Akzeptanzkriterien fuer MVP-Releasekandidat

- Lernloop funktioniert ohne Internet
- Kind kann ohne Lesekompetenz die Hauptpfade bedienen
- Hoer-/Sehhilfen sind einzeln schaltbar
- Lernfortschritt bleibt lokal erhalten
- Analyse und Tests laufen gruen
