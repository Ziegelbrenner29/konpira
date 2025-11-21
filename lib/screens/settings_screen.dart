// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matcha/providers/settings_provider.dart';   // <<< DAS FEHLTE!

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Einstellungen', style: TextStyle(color: Color(0xFF4A3728), fontSize: 28)),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/paper_texture.png'),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF5F0E1), Color(0xFFE8DAB2)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Audio'),
                _bambooSlider(
                  label: 'Master Lautstärke',
                  value: settings.masterVolume,
                  onChanged: notifier.updateMasterVolume,
                ),
                _bambooSlider(
                  label: 'Hintergrundmusik',
                  value: settings.bgmVolume,
                  onChanged: notifier.updateBgmVolume,
                ),
                _switchTile(
                  title: 'Gesang (Konpira / Matcha pon!)',
                  value: settings.voiceEnabled,
                  onChanged: notifier.updateVoiceEnabled,
                ),
                _bambooSlider(
                  label: 'Soundeffekte (tok/pon/DON!)',
                  value: settings.sfxVolume,
                  onChanged: notifier.updateSfxVolume,
                ),
                _bambooSliderInt(
                  label: 'Haptics Intensität',
                  value: settings.hapticsIntensity.toDouble(),
                  min: 0,
                  max: 3,
                  divisions: 3,
                  labels: const ['Aus', 'Leicht', 'Mittel', 'Stark'],
                  onChanged: (v) => notifier.updateHapticsIntensity(v.round()),
                ),

                const SizedBox(height: 32),
                _sectionTitle('Gameplay'),
                _bambooSliderInt(
                  label: 'Timing-Fenster (±ms)',
                  value: settings.timingWindowMs.toDouble(),
                  min: 50,
                  max: 120,
                  divisions: 7,
                  onChanged: (v) => notifier.updateTimingWindowMs(v.round()),
                ),
                _segmentedFakes(notifier, settings.maxFakesInARow),
                _aiDifficultyPlaceholder(settings.aiDifficulty),

                const SizedBox(height: 32),
                _sectionTitle('Visuals'),
                _bambooSlider(
                  label: 'Animations-Intensität',
                  value: settings.animationIntensity,
                  onChanged: notifier.updateAnimationIntensity,
                ),

                const SizedBox(height: 48),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _showResetDialog(context),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade300),
                    child: const Text('Highscores zurücksetzen', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 24),
        child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4A3728))),
      );

  Widget _bambooSlider({
    required String label,
    required double value,
    required void Function(double) onChanged,
  }) =>
      _SliderTile(
        label: label,
        value: value,
        onChanged: onChanged,
      );

  Widget _bambooSliderInt({
    required String label,
    required double value,
    required double min,
    required double max,
    required int divisions,
    List<String>? labels,
    required void Function(double) onChanged,
  }) =>
      _SliderTile(
        label: label,
        value: value,
        min: min,
        max: max,
        divisions: divisions,
        labels: labels,
        onChanged: onChanged,
      );

  Widget _switchTile({
    required String title,
    required bool value,
    required void Function(bool) onChanged,
  }) =>
      ListTile(
        title: Text(title, style: const TextStyle(fontSize: 18, color: Color(0xFF4A3728))),
        trailing: Switch(value: value, onChanged: onChanged, activeColor: const Color(0xFF8B9F7A)),
      );

  Widget _segmentedFakes(SettingsNotifier notifier, int current) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Max Fake-Outs in Folge', style: TextStyle(fontSize: 18, color: Color(0xFF4A3728))),
            const SizedBox(height: 8),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 1, label: Text('1')),
                ButtonSegment(value: 2, label: Text('2')),
                ButtonSegment(value: 99, label: Text('∞')),
              ],
              selected: {current == 99 ? 99 : current},
              onSelectionChanged: (Set<int> newSelection) {
                final val = newSelection.first;
                notifier.updateMaxFakesInARow(val == 99 ? 99 : val);
              },
            ),
          ],
        ),
      );

  Widget _aiDifficultyPlaceholder(int value) => Opacity(
        opacity: 0.5,
        child: _bambooSliderInt(
          label: 'KI-Schwierigkeit (bald!)',
          value: value.toDouble(),
          min: 1,
          max: 5,
          divisions: 4,
          labels: const ['Zen-Schüler', 'Schüler', 'Meister', 'Großmeister', 'Unmöglich'],
          onChanged: (_) {}, // disabled
        ),
      );

  void _showResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Highscores zurücksetzen?'),
        content: const Text('Das kann nicht rückgängig gemacht werden.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Abbrechen')),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Löschen', style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}

// Custom Bamboo-Slider Widget (minimalistisch, aber wunderschön)
class _SliderTile extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final List<String>? labels;
  final void Function(double) onChanged;

  const _SliderTile({
    required this.label,
    required this.value,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.labels,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 18, color: Color(0xFF4A3728))),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(height: 12, color: const Color(0xFF8B9F7A).withOpacity(0.3)), // Bambus-Track-Hintergrund
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 12,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 16),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 28),
                  activeTrackColor: const Color(0xFF8B9F7A),
                  inactiveTrackColor: const Color(0xFF8B9F7A).withOpacity(0.3),
                  thumbColor: const Color(0xFF4A3728),
                ),
                child: Slider(
                  value: value.clamp(min, max),
                  min: min,
                  max: max,
                  divisions: divisions,
                  label: labels != null ? labels![value.round().clamp(0, labels!.length - 1)] : null,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}