# Pedagogy 6to7 Birkenbihl Leveling

## Zielgruppe
- Kinder von 6 bis 7 Jahren.
- Fokus: Hoeren, Verstehen, Sprechen.
- Schreiben erst spaeter, nur als optionale Stuetze.

## Leveling bis B1
| Stufe | Fokus | Sprachziel | Aufstieg |
| --- | --- | --- | --- |
| `A0` | Ankommen und Verstehen | 10-20 Alltagschunks wiedererkennen, auf Name, Hallo, Bitte, Stop reagieren | 8 von 10 Hoerreizen korrekt verstanden, ohne Sprechdruck |
| `A1.1` | Sichere Mini-Muster | Begruessen, sagen wer man ist, einfache Beduerfnisse und Gefuehle aeussern | `pattern_match_score >= 0.70` in 2 kurzen Aktivrunden und 80% Hoerverstehen |
| `A1.2` | Vertraute Welt erweitern | Familie, Schule, Essen, Orte, Vorlieben in 1-2 kurzen Saetzen | `pattern_match_score >= 0.72`, Transfer mit einer veraenderten Variable gelingt 3 von 4 Mal |
| `A2.1` | Alltag in Reihenfolge | Tagesablauf, Zeit, Weg, Freizeit, Einkauf in 2-3 verbundenen Mustern | `pattern_match_score >= 0.75`, Hoerverstehen eines bekannten Mini-Dialogs bei 80% |
| `A2.2` | Probleme und Plaene | gestern/heute/morgen, kleine Probleme, Hilfe holen, Absichten sagen | `pattern_match_score >= 0.78`, 4 von 5 Problemsituationen funktional geloest |
| `B1.1` | Begruenden und vergleichen | einfache Meinung, Grund, Vergleich, Nachfrage | `pattern_match_score >= 0.82`, 1 Minute gestuetztes Sprechen mit Grundstruktur |
| `B1.2` | Selbststaendig handeln | kurze Gespraeche tragen, Plan aendern, Erlebnis einfach reflektieren | `pattern_match_score >= 0.85`, Transfer in neuem Kontext gelingt 4 von 5 Mal |

## Uebungstypen pro Stufe
| Stufe | `decode` | `passive_listen` | `active_apply` | `transfer` |
| --- | --- | --- | --- | --- |
| `A0` | 1 Satz, Bild plus Chunk | 15-30 Sek. Audio-Loops | Zeigen, nicken, 1 Wort sprechen | nur Objekt oder Person tauschen |
| `A1.1` | 1-2 kurze Saetze | 30-60 Sek. ruhige Wiederholung | Satzrahmen mit Nachsprechhilfe | Gefuehl, Name oder Ort tauschen |
| `A1.2` | kurze Alltagsmuster | bekannte Minidialoge im Hintergrund | 2-teilige Antwort mit Auswahlhilfe | eine Variable aendern, Rest bleibt gleich |
| `A2.1` | Sequenzen mit Zeit oder Ort | gleiche Dialoge in natuerlicherem Tempo | 2-3 Muster kombinieren | Reihenfolge, Zeit oder Ziel aendern |
| `A2.2` | Problem plus Loesung als Chunks | Plan- und Hilfe-Saetze mehrfach hoeren | kurze eigene Problemantwort | Problem oder Loesung variieren |
| `B1` | Meinung, Grund, Plan als Sinnpakete | kurze Geschichten oder Dialoge | gestuetztes Sprechen mit Bild- oder Kartenhilfe | neuer Kontext mit gleicher Kommunikationsfunktion |

## Spielmechaniken fuer 6-7
- Sammelpfad statt Punktedruck: jedes verstandene Muster fuellt einen kleinen Reiseweg.
- Audio-Sterne: Sterne gibt es fuer Zuhoren, nicht nur fuer richtiges Sprechen.
- Rollen-Spiel: Tierfigur, Detektiv, Reisebegleiter oder Klassenheld fuehrt durch die Uebung.
- Freischaltkarten: neue Kontexte werden nach mehreren ruhigen Wiederholungen sichtbar.
- Sofortiges Erfolgssignal: freundlicher Klang, Bewegung oder Sticker bei funktionalem Verstehen.
- Kurze Missionen: 2-4 Minuten pro Einheit, danach klares Ende.
- Wahlmoeglichkeit: Kind darf zwischen zwei Themen, Stimmen oder Figuren waehlen.

## Inklusionsfreundliche Varianten
### Bei Hoerschwaeche
- Immer mit klarer visueller Chunk-Anzeige und gut lesbaren Symbolen.
- Unterstuetzende Vibration, Farbwechsel oder Animation bei Audio-Start und Chunk-Wechsel.
- Langsameres TTS, saubere Pausen, optionale Wiederholung pro Chunk.
- Lippenbild oder Sprecher-Avatar optional einblendbar.
- Mehr Gewicht auf `decode` plus `active_apply` mit Sichtstuetze, weniger Pflicht auf passives Audio.

### Bei Sehschwaeche
- Hoher Kontrast, grosse Touch-Ziele, einfache Layouts ohne visuelle Ueberladung.
- Jede Bildinfo auch als Audiohinweis.
- Screenreader-taugliche Reihenfolge, klare Labels, wenig Text pro Screen.
- Haptische oder akustische Rueckmeldung bei Interaktion.
- `decode_map` auch vorlesbar als Chunk-fuer-Chunk-Fuehrung.

## Ethische Leitplanken
- Kein Zeitdruck, keine Strafmechanik, keine Verlustangst.
- Keine Beschaemung bei Fehlern; Rueckmeldung bleibt ruhig, kurz und funktional.
- Inhalte bleiben kindgerecht, alltagsnah und emotional sicher.
- Sprechen ist Einladung, nicht Zwang; Verstehen zaehlt zuerst.
- Keine manipulative Monetarisierung ueber Angst, Streak-Verlust oder soziale Vergleiche.
- Fortschritt wird gegen das eigene Vorwissen gemessen, nicht gegen andere Kinder.

## Messbare Testkriterien
### Aufstieg
- Hoeren: mindestens 80% Sinnverstehen bei bekannten Items einer Stufe.
- Aktiv: `pattern_match_score` erreicht die Stufen-Schwelle in 2 getrennten Sessions.
- Transfer: mindestens 3 von 4 Uebungen mit genau einer geaenderten Variable gelingen funktional.
- Belastung: Kind bleibt regulaer ansprechbar und zeigt keine deutlichen Stresssignale in der Testphase.

### Wiederholung
- Unter 70% Hoerverstehen bei bekannten Items.
- `pattern_match_score` unter Stufen-Schwelle in 2 Sessions.
- Transfer kippt, sobald mehr als eine Variable veraendert wird.
- Deutliche Ermuedung, Frust oder Vermeidungsverhalten: dann kuerzer, leichter, mehr `decode` und `passive_listen`.

## Implementationshinweise
- Standardfluss pro Einheit: `decode -> passive_listen -> active_apply -> transfer`.
- Fuer 6-7 jaehrige lieber mehr kurze Einheiten als lange Lektionen.
- Schreiben nur optional: Bild antippen, Karte ziehen, Wort ansehen, aber nicht als Pflicht zum Bestehen.
