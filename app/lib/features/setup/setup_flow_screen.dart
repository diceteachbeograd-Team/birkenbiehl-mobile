import 'package:flutter/material.dart';

import '../../core/i18n/app_strings.dart';

class SetupFlowScreen extends StatelessWidget {
  const SetupFlowScreen({
    super.key,
    required this.selectedLanguage,
    required this.selectedLevel,
    required this.selectedContext,
    required this.onLanguageChanged,
    required this.onLevelChanged,
    required this.onContextChanged,
    required this.onFinish,
    required this.strings,
  });

  final String? selectedLanguage;
  final String? selectedLevel;
  final String? selectedContext;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<String> onLevelChanged;
  final ValueChanged<String> onContextChanged;
  final VoidCallback onFinish;
  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    final ready =
        selectedLanguage != null &&
        selectedLevel != null &&
        selectedContext != null;

    return ListView(
      key: const Key('setupFlow'),
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          strings.setupTitle,
          key: const Key('setupTitle'),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(strings.setupSubtitle),
        const SizedBox(height: 16),
        _SetupCard(
          title: strings.setupStepLanguage,
          icon: Icons.public_rounded,
          children: [
            _ChoiceButton(
              key: const Key('language_en'),
              text: strings.languageEnglish,
              selected: selectedLanguage == 'en',
              onTap: () => onLanguageChanged('en'),
            ),
            _ChoiceButton(
              key: const Key('language_de'),
              text: strings.languageGerman,
              selected: selectedLanguage == 'de',
              onTap: () => onLanguageChanged('de'),
            ),
            _ChoiceButton(
              key: const Key('language_es'),
              text: strings.languageSpanish,
              selected: selectedLanguage == 'es',
              onTap: () => onLanguageChanged('es'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _SetupCard(
          title: strings.setupStepLevel,
          icon: Icons.flag_rounded,
          children: [
            _ChoiceButton(
              key: const Key('level_a0'),
              text: 'Erste Woerter',
              selected: selectedLevel == 'a0',
              onTap: () => onLevelChanged('a0'),
            ),
            _ChoiceButton(
              key: const Key('level_a1'),
              text: 'Kurze Saetze',
              selected: selectedLevel == 'a1',
              onTap: () => onLevelChanged('a1'),
            ),
            _ChoiceButton(
              key: const Key('level_a2'),
              text: 'Kleine Gespraeche',
              selected: selectedLevel == 'a2',
              onTap: () => onLevelChanged('a2'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _SetupCard(
          title: strings.setupStepContext,
          icon: Icons.favorite_rounded,
          children: [
            _ChoiceButton(
              key: const Key('context_school'),
              text: 'Schule',
              selected: selectedContext == 'school',
              onTap: () => onContextChanged('school'),
            ),
            _ChoiceButton(
              key: const Key('context_family'),
              text: 'Familie',
              selected: selectedContext == 'family',
              onTap: () => onContextChanged('family'),
            ),
            _ChoiceButton(
              key: const Key('context_travel'),
              text: 'Unterwegs',
              selected: selectedContext == 'travel',
              onTap: () => onContextChanged('travel'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          key: const Key('finishSetupButton'),
          onPressed: ready ? onFinish : null,
          icon: const Icon(Icons.play_arrow_rounded),
          label: Text(strings.setupFinish),
        ),
      ],
    );
  }
}

class _SetupCard extends StatelessWidget {
  const _SetupCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 8),
                Expanded(child: Text(title)),
              ],
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _ChoiceButton extends StatelessWidget {
  const _ChoiceButton({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: FilledButton.icon(
          onPressed: onTap,
          icon: const Icon(Icons.check_circle_rounded),
          label: Text(text),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: OutlinedButton(onPressed: onTap, child: Text(text)),
    );
  }
}
