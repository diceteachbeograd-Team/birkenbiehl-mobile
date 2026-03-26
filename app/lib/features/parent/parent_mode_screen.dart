import 'package:flutter/material.dart';

class ParentModeScreen extends StatefulWidget {
  const ParentModeScreen({
    super.key,
    required this.currentTemplateTitle,
    required this.currentStepLabel,
    required this.completedLoops,
    required this.hearingAssist,
    required this.visionAssist,
    required this.lastUpdatedLabel,
    required this.onExportMarkdown,
    required this.onExportPdf,
  });

  final String currentTemplateTitle;
  final String currentStepLabel;
  final int completedLoops;
  final bool hearingAssist;
  final bool visionAssist;
  final String lastUpdatedLabel;
  final Future<String> Function() onExportMarkdown;
  final Future<String> Function() onExportPdf;

  @override
  State<ParentModeScreen> createState() => _ParentModeScreenState();
}

class _ParentModeScreenState extends State<ParentModeScreen> {
  bool _isExporting = false;
  String? _lastExportPath;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Elternmodus', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Einstellungen, Lernstand und Exporte verwalten.'),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.security_rounded),
            title: const Text('Schutz aktiv'),
            subtitle: Text('Letzte Speicherung: ${widget.lastUpdatedLabel}'),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.insights_rounded),
            title: Text('Aktuelle Uebung: ${widget.currentTemplateTitle}'),
            subtitle: Text(
              'Schritt: ${widget.currentStepLabel} | Loops: ${widget.completedLoops}',
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.accessibility_new_rounded),
            title: const Text('Assistenzstatus'),
            subtitle: Text(
              'Hoerhilfe: ${widget.hearingAssist ? 'An' : 'Aus'} | Sehhilfe: ${widget.visionAssist ? 'An' : 'Aus'}',
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                key: const Key('exportMarkdownButton'),
                onPressed: _isExporting
                    ? null
                    : () => _runExport(widget.onExportMarkdown),
                icon: const Icon(Icons.description_rounded),
                label: const Text('Export .md'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton.tonalIcon(
                key: const Key('exportPdfButton'),
                onPressed: _isExporting
                    ? null
                    : () => _runExport(widget.onExportPdf),
                icon: const Icon(Icons.picture_as_pdf_rounded),
                label: const Text('Export .pdf'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (_isExporting) const LinearProgressIndicator(),
        if (_lastExportPath != null) ...[
          const SizedBox(height: 8),
          Text('Export gespeichert: $_lastExportPath'),
        ],
      ],
    );
  }

  Future<void> _runExport(Future<String> Function() exporter) async {
    setState(() {
      _isExporting = true;
    });

    try {
      final path = await exporter();
      if (!mounted) {
        return;
      }
      setState(() {
        _lastExportPath = path;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Export gespeichert: $path')));
    } finally {
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    }
  }
}
