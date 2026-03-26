# Design- und Paedagogik-Leitlinie fuer die GUI

Diese Leitlinie ist die gemeinsame Arbeitsgrundlage fuer Design, Entwicklung und Didaktik. Sie priorisiert kindgerechte Klarheit, den Birkenbihl-Lernloop und barrierearme Umsetzung.

## 1. Visuelle Prinzipien fuer 6- bis 7-Jaehrige

- Pro Screen nur eine Hauptaufgabe.
- Gross, klar, freundlich: wenig Text, grosse Ziele, eindeutige Icons.
- Ein Inhalt = ein Fokus; keine dichten Listen, keine ueberladenen Karten.
- Kontrast hoch, Formen einfach, Farben sparsam und bedeutungstragend.
- Fortschritt sichtbar machen: Schritt, Status und naechste Aktion immer erkennbar.
- Fehler nie strafend zeigen, sondern mit naechstem konkretem Schritt.
- Emotion ja, Ablenkung nein: kleine, ruhige Freude statt dauernder Animation.

## 2. Birkenbihl-Lernloop im UI

Der Lernfluss folgt immer derselben Logik:

1. Dekodieren
   - Neues Wort oder neuer Satz wird in kleine, verstehbare Teile zerlegt.
   - UI zeigt Wort, Lautbild und Bedeutung klar getrennt.
   - Tippen auf ein Segment zeigt eine einfache Erklaerung.

2. Passiv hoeren
   - Audio laeuft mit klarer Markierung des aktuellen Inhalts.
   - Der Nutzer kann mitsehen, mithoeren oder nur hoeren.
   - Keine Pflicht zur aktiven Antwort in dieser Phase.

3. Aktiv antworten
   - Kurze Rueckfrage, Auswahl, Nachsprechen oder Zuordnen.
   - Nur eine Antwortform pro Aufgabe, damit die kognitive Last niedrig bleibt.
   - Sofortiges, freundliches Feedback mit sichtbarem Fortschritt.

4. Transfer
   - Das Gelernte wird in einen kleinen Alltagssatz, ein Spiel oder eine Mini-Situation uebertragen.
   - Transfer-Aufgaben sind kurz, alltagsnah und wiederholbar.
   - Der Nutzer sieht, was er jetzt koennen kann.

## 3. Adaptive UI-Regeln

- Schnell: weniger Zwischenbildschirme, direkter weiter, mehr Selbstbedienung.
- Langsam: mehr Erklaerung, mehr Wiederholung, laengere Verweilzeit.
- Audio-stark: Audio fuehrt, Text begleitet nur stichwortartig.
- Visuell-stark: Text und Bild fuehren, Audio kann pausiert oder reduziert sein.
- Jede Anpassung bleibt manuell kontrollierbar.
- Die App darf Tempo, Wiederholung und Darstellungsart vorschlagen, aber nie starr aufzwingen.
- Adaptation basiert auf beobachtbarem Verhalten: Wiederholungen, Pausen, Fehleingaben, Audio-Nutzung.
- Ein Wechsel der Lernart muss immer klar sichtbar sein.

## 4. Accessibility

- Alle Kernfunktionen sind ohne Audio, ohne nur visuelle Codierung und ohne spezielle Gesten nutzbar.
- Hoer- und Sehschwaeche werden ueber separate, schaltbare Hilfen abgefangen.
- Screenreader bekommen saubere Reihenfolge, Rollen, Zustände und Namen.
- Live-Feedback wird angesagt, aber nicht zu laut oder zu haeufig.
- Braille-kompatibel bedeutet: lineare Semantik, klare Beschriftungen, keine reine Icon-UI, keine versteckten Pfade.
- Jede Lernaktion braucht eine textliche Entsprechung.
- Kontrast, Schriftgroesse und Zielgroesse bleiben auch bei grossen Einstellungen stabil.

## 5. Motivationssystem ohne Dark Patterns

- Fortschritt statt Druck: Sterne, Rueckmeldungen und Serien nur als positive Orientierung.
- Keine Schuld- oder Verlustlogik, kein "Du verlierst alles", keine manipulative Dringlichkeit.
- Belohnungen sind nachvollziehbar und immer abschaltbar.
- Motivation basiert auf Sichtbarkeit von Wachstum: geschafft, wiederholt, verbessert, erweitert.
- Eltern sehen Fortschritt, Kinder sehen naechsten kleinen Erfolg.
- Pausen, Abbruch und spaeteres Wiederkommen werden als normal behandelt.

## 6. Konkrete Screen-Spezifikation

### Start

- Ziel: schnell in eine passende Lernaktivitaet.
- Inhalt: letzter Fortschritt, grosser Start-Button, kurze empfohlene Naechste Aufgabe.
- Optional: Audio an/aus, Lernmodus, Elternzugang.
- Keine langen Erklaerungen; nur Orientierung und Einstieg.

### Uebung

- Ziel: ein Wort, Satz oder Muster sicher verstehen.
- Aufbau: oben Status, Mitte Lerninhalt, unten eine einzige klare Aktion.
- Dekodierhilfe und Audio sind direkt erreichbar.
- Feedback erscheint sofort und kurz.

### Sprechen

- Ziel: nachsprechen oder laut antworten ohne Druck.
- Aufbau: hoerbare Vorlage, klare Sprechaufforderung, Aufnahme/Pruefung nur wenn sinnvoll.
- Timer, Wiederholung und Tempo sichtbar steuerbar.
- Falsche Antworten werden als "nochmal" oder "anders versuchen" behandelt, nicht als Fehleretikett.

### Verlauf

- Ziel: Fortschritt rueckblickend verstehen.
- Inhalt: absolvierte Einheiten, Wiederholungen, starke Stellen, naechste Empfehlung.
- Darstellung: chronologisch, einfach, mit wenig Dichte.
- Nur die wichtigsten Kennzahlen zeigen; keine Datenwand.

### Elternmodus

- Ziel: Einstellungen, Fortschritt und Schutzeinstellungen verwalten.
- Inhalt: Zeitlimits, Audio-/Textoptionen, Lernstand, Datenexport oder Loeschung falls vorgesehen.
- Kinderbereich und Elternbereich sind klar getrennt.
- Entscheidungen im Elternmodus wirken transparent und rueckgaengig, soweit technisch moeglich.

## 7. Naechste 10 priorisierte Tasks fuer die kommende Woche

1. Startscreen als erste klickbare Struktur mit einem Haupt-CTA und Fortschrittsanzeige definieren.
2. Uebungsscreen mit Dekodieransicht, Audioleiste und einer Antwortaktion prototypen.
3. Sprechen-Screen mit einfacher Aufnahme- oder Nachsprechlogik skizzieren.
4. Verlaufsscreen als kompakte Liste mit Wochenansicht und naechster Empfehlung anlegen.
5. Elternmodus als klar getrennte Einstellungs- und Kontrollzone strukturieren.
6. UI-Varianten fuer schnell/langsam und audio/visuell als schaltbare Zustandslogik beschreiben.
7. Accessibility-Basics fuer Schrift, Kontrast, Fokus und Screenreader auf die Kernscreens anwenden.
8. Motivationsbausteine ohne Drucklogik definieren und die abschaltbaren Elemente markieren.
9. Ein kleines Design-Set fuer Farben, Typografie, Abstaende und Icon-Stil festziehen.
10. Einen End-to-End-Lernloop vom Start bis Transfer als User Flow dokumentieren und mit den Screens abgleichen.

## Arbeitsregel

- Keine neue UI-Komponente ohne klaren Beitrag zum Lernloop oder zur Barrierearmut.
- Jede Ansicht muss in maximal drei Sekunden erfassbar sein.
- Wenn ein Element nur dekorativ ist, wird es weggelassen.
