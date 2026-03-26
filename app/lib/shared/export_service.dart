import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class ExportPayload {
  const ExportPayload({
    required this.templateTitle,
    required this.currentStepLabel,
    required this.completedLoops,
    required this.hearingAssist,
    required this.visionAssist,
    required this.successStreak,
    required this.struggleStreak,
    required this.recentEvents,
    required this.gameStars,
    required this.gameBadges,
    required this.questProgress,
    required this.selectedLanguage,
    required this.selectedLevel,
    required this.selectedContext,
    required this.uiLanguageCode,
    required this.generatedAt,
  });

  final String templateTitle;
  final String currentStepLabel;
  final int completedLoops;
  final bool hearingAssist;
  final bool visionAssist;
  final int successStreak;
  final int struggleStreak;
  final List<String> recentEvents;
  final int gameStars;
  final int gameBadges;
  final int questProgress;
  final String? selectedLanguage;
  final String? selectedLevel;
  final String? selectedContext;
  final String uiLanguageCode;
  final DateTime generatedAt;
}

class ExportService {
  Future<File> exportMarkdown(ExportPayload payload) async {
    final directory = await _ensureExportDirectory();
    final file = File(
      '${directory.path}/birkenbiehl_progress_${_stamp(payload.generatedAt)}.md',
    );

    final content = StringBuffer()
      ..writeln('# Birkenbiehl Lernstand')
      ..writeln()
      ..writeln('- Zeitpunkt: ${payload.generatedAt.toIso8601String()}')
      ..writeln('- Aktuelle Uebung: ${payload.templateTitle}')
      ..writeln('- Aktueller Schritt: ${payload.currentStepLabel}')
      ..writeln('- Sprache: ${payload.selectedLanguage ?? 'n/a'}')
      ..writeln('- Lernstufe: ${payload.selectedLevel ?? 'n/a'}')
      ..writeln('- Thema: ${payload.selectedContext ?? 'n/a'}')
      ..writeln('- App-Sprache: ${payload.uiLanguageCode}')
      ..writeln('- Abgeschlossene Loops: ${payload.completedLoops}')
      ..writeln(
        '- Hilfen aktiv: ${_assistiveLabel(payload.hearingAssist, payload.visionAssist)}',
      )
      ..writeln('- Erfolgsserie: ${payload.successStreak}')
      ..writeln('- Hilfe-Serie: ${payload.struggleStreak}')
      ..writeln('- Spielsterne: ${payload.gameStars}')
      ..writeln('- Abzeichen: ${payload.gameBadges}')
      ..writeln('- Tagesquest: ${payload.questProgress}/5')
      ..writeln()
      ..writeln('## Naechste Empfehlung')
      ..writeln(_nextRecommendation(payload))
      ..writeln()
      ..writeln('## Letzte Lernaktionen');

    if (payload.recentEvents.isEmpty) {
      content.writeln('- Keine Aktionen gespeichert.');
    } else {
      for (final event in payload.recentEvents.take(10)) {
        content.writeln('- $event');
      }
    }

    await file.writeAsString(content.toString());
    return file;
  }

  Future<File> exportPdf(ExportPayload payload) async {
    final directory = await _ensureExportDirectory();
    final file = File(
      '${directory.path}/birkenbiehl_progress_${_stamp(payload.generatedAt)}.pdf',
    );

    final document = pw.Document();
    document.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Birkenbiehl Lernstand',
                style: pw.TextStyle(fontSize: 22),
              ),
              pw.SizedBox(height: 12),
              pw.Text('Zeitpunkt: ${payload.generatedAt.toIso8601String()}'),
              pw.Text('Aktuelle Uebung: ${payload.templateTitle}'),
              pw.Text('Aktueller Schritt: ${payload.currentStepLabel}'),
              pw.Text('Sprache: ${payload.selectedLanguage ?? 'n/a'}'),
              pw.Text('Lernstufe: ${payload.selectedLevel ?? 'n/a'}'),
              pw.Text('Thema: ${payload.selectedContext ?? 'n/a'}'),
              pw.Text('App-Sprache: ${payload.uiLanguageCode}'),
              pw.Text('Abgeschlossene Loops: ${payload.completedLoops}'),
              pw.Text(
                'Hilfen aktiv: ${_assistiveLabel(payload.hearingAssist, payload.visionAssist)}',
              ),
              pw.Text('Erfolgsserie: ${payload.successStreak}'),
              pw.Text('Hilfe-Serie: ${payload.struggleStreak}'),
              pw.Text('Spielsterne: ${payload.gameStars}'),
              pw.Text('Abzeichen: ${payload.gameBadges}'),
              pw.Text('Tagesquest: ${payload.questProgress}/5'),
              pw.SizedBox(height: 12),
              pw.Text('Naechste Empfehlung:'),
              pw.Text(_nextRecommendation(payload)),
              pw.SizedBox(height: 12),
              pw.Text('Letzte Lernaktionen:'),
              if (payload.recentEvents.isEmpty)
                pw.Text('- Keine Aktionen gespeichert.')
              else
                ...payload.recentEvents
                    .take(8)
                    .map((event) => pw.Text('- $event')),
            ],
          );
        },
      ),
    );

    await file.writeAsBytes(await document.save());
    return file;
  }

  Future<Directory> _ensureExportDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final exportDir = Directory('${appDir.path}/exports');
    if (!await exportDir.exists()) {
      await exportDir.create(recursive: true);
    }
    return exportDir;
  }

  String _assistiveLabel(bool hearingAssist, bool visionAssist) {
    final enabled = <String>[];
    if (hearingAssist) {
      enabled.add('Hoerhilfe');
    }
    if (visionAssist) {
      enabled.add('Sehhilfe');
    }
    return enabled.isEmpty ? 'Keine' : enabled.join(' + ');
  }

  String _nextRecommendation(ExportPayload payload) {
    if (payload.struggleStreak >= 1) {
      return 'Noch eine Dekodier-Runde mit langsamerem Audio und Bildhilfe.';
    }
    if (payload.successStreak >= 1) {
      return 'Naechsten Lernschritt starten und dann in einen Transfer-Satz wechseln.';
    }
    return 'Mit einer kurzen Hoerphase starten und danach aktiv antworten.';
  }

  String _stamp(DateTime time) {
    final y = time.year.toString().padLeft(4, '0');
    final m = time.month.toString().padLeft(2, '0');
    final d = time.day.toString().padLeft(2, '0');
    final h = time.hour.toString().padLeft(2, '0');
    final min = time.minute.toString().padLeft(2, '0');
    return '$y$m${d}_$h$min';
  }
}
