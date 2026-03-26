import 'package:flutter/material.dart';

import '../../core/i18n/app_strings.dart';

class ParentTemplateOption {
  const ParentTemplateOption({required this.id, required this.title});

  final String id;
  final String title;
}

class ParentModeScreen extends StatefulWidget {
  const ParentModeScreen({
    super.key,
    required this.currentTemplateTitle,
    required this.currentStepLabel,
    required this.completedLoops,
    required this.hearingAssist,
    required this.visionAssist,
    required this.lastUpdatedLabel,
    required this.templates,
    required this.selectedTemplateId,
    required this.onTemplateChanged,
    required this.selectedUiLanguageCode,
    required this.onUiLanguageChanged,
    required this.strings,
    required this.onClearHistory,
    required this.onExportMarkdown,
    required this.onExportPdf,
  });

  final String currentTemplateTitle;
  final String currentStepLabel;
  final int completedLoops;
  final bool hearingAssist;
  final bool visionAssist;
  final String lastUpdatedLabel;
  final List<ParentTemplateOption> templates;
  final String selectedTemplateId;
  final ValueChanged<String> onTemplateChanged;
  final String selectedUiLanguageCode;
  final ValueChanged<String> onUiLanguageChanged;
  final AppStrings strings;
  final VoidCallback onClearHistory;
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
        Text(
          widget.strings.parentTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(widget.strings.parentSubtitle),
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
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Lernpfad steuern'),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  key: const Key('templateSelectorDropdown'),
                  initialValue: widget.selectedTemplateId,
                  decoration: const InputDecoration(
                    labelText: 'Thema auswaehlen',
                    border: OutlineInputBorder(),
                  ),
                  items: widget.templates
                      .map(
                        (template) => DropdownMenuItem<String>(
                          value: template.id,
                          child: Text(template.title),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    widget.onTemplateChanged(value);
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  key: const Key('uiLanguageSelectorDropdown'),
                  initialValue: widget.selectedUiLanguageCode,
                  decoration: InputDecoration(
                    labelText: widget.strings.parentUiLanguageLabel,
                    border: const OutlineInputBorder(),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'de',
                      child: Text(widget.strings.languageGerman),
                    ),
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(widget.strings.languageEnglish),
                    ),
                    DropdownMenuItem(
                      value: 'es',
                      child: Text(widget.strings.languageSpanish),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    widget.onUiLanguageChanged(value);
                  },
                ),
                const SizedBox(height: 6),
                Text(widget.strings.parentUiLanguage),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  key: const Key('clearHistoryButton'),
                  onPressed: widget.onClearHistory,
                  icon: const Icon(Icons.delete_sweep_rounded),
                  label: const Text('Lernhistorie leeren'),
                ),
              ],
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
