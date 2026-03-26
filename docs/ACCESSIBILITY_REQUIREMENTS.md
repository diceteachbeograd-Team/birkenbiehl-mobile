# Accessibility Requirements

## Ziel
Dieses Dokument definiert ein kompaktes, implementierbares Requirements-Pack fuer barrierearme Nutzung im mobilen App-Kontext.

Adressiert werden:
- Hoerschwaeche
- Sehschwaeche
- Screenreader-Nutzung
- Braille-Ausgabe

## Grundprinzipien
- Barrierehilfen sind individuell aktivierbar und deaktivierbar.
- Keine einzelne Hilfe darf die Nutzung einer anderen ausschliessen.
- Informationen duerfen niemals nur ueber Farbe, Ton, Animation oder rein visuelle Position vermittelt werden.
- Jede Kernfunktion muss ohne Audio, ohne Gesten-Magie und ohne visuelle Sondereffekte nutzbar bleiben.
- Dynamische Inhalte muessen fuer Assistive Technologies nachvollziehbar ankündigt werden.

## Schaltbare Hilfen
Die App muss folgende Hilfen separat schaltbar bereitstellen:
- Grosse Schrift
- Hoher Kontrast
- Reduzierte Bewegung
- Beschriftungen fuer Audio- und Videoinhalte
- Haptische oder visuelle Ersatzsignale fuer akustische Hinweise
- Screenreader-optimierte Ausgabe

### Anforderungen an die Schaltbarkeit
- Jede Hilfe ist einzeln aktivierbar.
- Die Aktivierung einer Hilfe aendert nur das Verhalten der dazugehoerigen Funktion.
- Einstellungen werden persistent gespeichert.
- Ruecksetzen auf Standard ist jederzeit moeglich.
- Wenn eine Funktion abhaengig von einer anderen ist, wird dies in der UI klar benannt, aber nicht automatisch erzwungen.

## Nicht-ausschliessende UX-Regeln
- Alle interaktiven Elemente haben einen eindeutig benoemten Zweck.
- Touch-Ziele sind gross genug fuer sichere Bedienung.
- Informationen und Statusmeldungen werden nicht nur ueber Farbe vermittelt.
- Wichtige Zustandswechsel erhalten eine sichtbare und eine semantische Rueckmeldung.
- Fehlermeldungen nennen Problem und naechsten Schritt.
- Fokus bleibt nachvollziehbar und darf nicht in versteckten Bereichen verschwinden.
- Bedienelemente duerfen nicht nur per Wischgeste, Doppeltipp oder Timing bedient werden.
- Inhalte duerfen nicht automatisch so schnell wechseln, dass sie nicht lesbar oder bedienbar sind.
- Bewegung, Blinkeffekte oder Parallaxeffekte duerfen nicht fuer das Verstehen der App notwendig sein.

## Anforderungen fuer Hoerschwaeche
- Saemtliche Audioinhalte erhalten eine textliche Alternative, sofern Audio/Video vorhanden ist.
- Alle akustischen Warnungen erhalten mindestens eine visuelle Alternative.
- Wenn Sprache oder Ton fuer den Ablauf relevant ist, gibt es eine gleichwertige textliche oder visuelle Rueckmeldung.
- Stille Zustände, Erfolg und Fehler duerfen nicht nur ueber Sound differenziert werden.

## Anforderungen fuer Sehschwaeche
- Text skaliert sauber mit den Systemeinstellungen.
- Layout bricht bei grosser Schrift nicht unkontrolliert um.
- Kontrastwerte muessen ausreichend sein.
- Inhalte bleiben bei Zoom und dynamischer Textgroesse lesbar.
- Bedeutungstragende Informationen sind nicht ausschliesslich farblich codiert.
- Icons und grafische Bedienelemente besitzen sichtbare oder semantische Labels.

## Anforderungen fuer Screenreader
- Alle interaktiven Elemente haben zugängliche Namen.
- Rollen, Zustände und Werte werden korrekt exponiert.
- Fokusreihenfolge entspricht der visuellen und logischen Reihenfolge.
- Modale Ansichten, Dialoge und Bottom Sheets bekommen einen sauberen Fokus-Start und Fokus-Ruecksprung.
- Neue Fehlermeldungen, Bestätigungen oder Ladezustände werden fuer Screenreader angesagt, ohne den aktuellen Kontext zu verlieren.
- Reine Dekoration wird fuer Assistive Technologies ausgeblendet.

## Anforderungen fuer Braille
- Alle relevanten Inhalte sind ueber semantische Strukturen erreichbar.
- Beschriftungen, Zustände und Gruppeninformationen sind nicht nur visuell vorhanden.
- Listen, Formulare und Navigation sind logisch gegliedert.
- Live-Updates und Fokuswechsel sind so aufgebaut, dass Braille-Displays ihnen folgen koennen.
- Keine geschlossenen visuellen Patterns ohne zugängliche Entsprechung.

## Sprint-1 Umfang
Sprint 1 liefert die Basis fuer:
- Einstellungsseite mit einzeln schaltbaren Hilfen
- Persistente Speicherung der Einstellungen
- Screenreader-taugliche Kernnavigation
- Sichtbare Alternativen fuer akustische Hinweise
- Textskalierung ohne Layoutbruch in den wichtigsten Screens

## Nicht im Sprint-1 Umfang
- Vollstaendige Feinabstimmung aller Sonderfaelle
- Externe Hilfsmittel-Integrationen jenseits der nativen Plattformfunktionen
- Komplette visuelle Neugestaltung
- Automatisierte Audio-Transkription fuer bestehende Medienarchive

## Umsetzungshinweis
Dieses Dokument ist als produktnahes Requirements-Pack gedacht. Die technische Umsetzung darf anders aussehen, solange die Acceptance Criteria erfuellt werden.
