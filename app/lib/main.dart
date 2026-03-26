import 'package:flutter/material.dart';

void main() {
  runApp(const BirkenbiehlApp());
}

class BirkenbiehlApp extends StatelessWidget {
  const BirkenbiehlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birkenbiehl Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E8A5A)),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;
  bool _hearingAssist = false;
  bool _visionAssist = false;

  static const List<({String label, IconData icon})> _tabs = [
    (label: 'Start', icon: Icons.home_rounded),
    (label: 'Sprechen', icon: Icons.mic_rounded),
    (label: 'Hören', icon: Icons.volume_up_rounded),
    (label: 'Üben', icon: Icons.extension_rounded),
    (label: 'Verlauf', icon: Icons.menu_book_rounded),
    (label: 'Export', icon: Icons.ios_share_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final current = _tabs[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Birkenbiehl Mobile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              current.label,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              _hintForTab(_currentIndex),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(current.icon),
                title: const Text('Nächste Mini-Aufgabe'),
                subtitle: Text(_taskForTab(_currentIndex)),
              ),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              key: const Key('hearingAssistToggle'),
              title: const Text('Hörhilfe'),
              subtitle: const Text('Untertitel und visuelle Hinweise'),
              value: _hearingAssist,
              onChanged: (v) => setState(() => _hearingAssist = v),
            ),
            SwitchListTile(
              key: const Key('visionAssistToggle'),
              title: const Text('Sehhilfe'),
              subtitle: const Text('Audioführung und hoher Kontrast'),
              value: _visionAssist,
              onChanged: (v) => setState(() => _visionAssist = v),
            ),
            const Spacer(),
            Text(
              'B1-Pfad: Dekodieren -> Hören -> Antworten',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: _tabs
            .map(
              (tab) => NavigationDestination(
                icon: Icon(tab.icon),
                label: tab.label,
              ),
            )
            .toList(),
      ),
    );
  }

  String _hintForTab(int tab) => switch (tab) {
        0 => 'Lerninsel mit Tageszielen und schnellem Einstieg.',
        1 => 'Kurz sprechen, lokal erkennen, dann Antwort üben.',
        2 => 'Passiv hören und Muster wiederholen.',
        3 => 'Dynamische Übungen passend zum Profil.',
        4 => 'Fortschritt und wiederholbare Muster.',
        _ => 'Gespräch als Markdown oder PDF teilen.',
      };

  String _taskForTab(int tab) => switch (tab) {
        0 => '3 kurze Sprechmuster starten',
        1 => '1 Antwort laut nachsprechen',
        2 => '1 Audio-Loop mit Wiederholung',
        3 => '1 Mini-Dialog fertigstellen',
        4 => 'Fehler von gestern erneut üben',
        _ => 'Letzte Session als .md exportieren',
      };
}
