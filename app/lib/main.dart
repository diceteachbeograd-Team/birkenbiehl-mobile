import 'package:flutter/material.dart';

import 'core/models/assistive_profile.dart';
import 'features/exercises/exercises_screen.dart';
import 'features/listening/listening_screen.dart';
import 'features/parent/parent_mode_screen.dart';
import 'features/progress/progress_screen.dart';
import 'features/speaking/speaking_screen.dart';
import 'features/start/start_screen.dart';

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
  AssistiveProfile _profile = const AssistiveProfile(
    hearingAssist: false,
    visionAssist: false,
  );

  static const List<({String label, IconData icon})> _tabs = [
    (label: 'Start', icon: Icons.home_rounded),
    (label: 'Sprechen', icon: Icons.mic_rounded),
    (label: 'Hoeren', icon: Icons.volume_up_rounded),
    (label: 'Uebung', icon: Icons.extension_rounded),
    (label: 'Verlauf', icon: Icons.menu_book_rounded),
    (label: 'Eltern', icon: Icons.admin_panel_settings_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Birkenbiehl Mobile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _buildScreen()),
            const SizedBox(height: 8),
            SwitchListTile(
              key: const Key('hearingAssistToggle'),
              title: const Text('Hoerhilfe'),
              subtitle: const Text('Untertitel und visuelle Hinweise'),
              value: _profile.hearingAssist,
              onChanged: (v) {
                setState(() {
                  _profile = _profile.copyWith(hearingAssist: v);
                });
              },
            ),
            SwitchListTile(
              key: const Key('visionAssistToggle'),
              title: const Text('Sehhilfe'),
              subtitle: const Text('Audiofuehrung und hoher Kontrast'),
              value: _profile.visionAssist,
              onChanged: (v) {
                setState(() {
                  _profile = _profile.copyWith(visionAssist: v);
                });
              },
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

  Widget _buildScreen() {
    switch (_currentIndex) {
      case 0:
        return StartScreen(profile: _profile);
      case 1:
        return const SpeakingScreen();
      case 2:
        return const ListeningScreen();
      case 3:
        return const ExercisesScreen();
      case 4:
        return const ProgressScreen();
      default:
        return const ParentModeScreen();
    }
  }
}
