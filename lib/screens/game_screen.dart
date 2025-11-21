// lib/screens/game_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konpira/widgets/chawan_widget.dart';
import 'package:konpira/providers/settings_provider.dart';
import 'package:konpira/models/game_state.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  String debugText = 'Bereit – teste Gesten!';
  double lastContactSize = 0.0;  // ✅ double statt Size!

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = ref.watch(settingsProvider).theme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(theme.paperAsset),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF5F0E1), Color(0xFFE8DAB2)],
          ),
        ),
        child: Listener(
          onPointerDown: (event) {
            lastContactSize = event.size;  // ✅ Jetzt passt's
            debugText = 'Pointer Down\nFläche: ${lastContactSize.round()} px²\nFinger: 1';
            setState(() {});
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: (d) {
              debugText = 'Single Tap\nFläche ≈ ${lastContactSize.round()} px²\nZone: ${_getZone(d.localPosition, size)}';
              setState(() {});
            },
            onDoubleTapDown: (d) {
              debugText = 'Double Tap – DON!\nFläche ≈ ${lastContactSize.round()} px²';
              setState(() {});
            },
            onLongPressStart: (d) {
              debugText = 'LongPress Start\nSchale hochheben';
              setState(() {});
            },
            onScaleStart: (_) {
              debugText = 'Pinch Start\nSchale hochheben';
              setState(() {});
            },
            onScaleUpdate: (d) {
              final fakeOut = d.scale > 1.1 ? 'Fake-Out!' : '';
              debugText = 'Pinch Update\nScale: ${d.scale.toStringAsFixed(2)}\n$fakeOut';
              setState(() {});
            },
            onScaleEnd: (_) {
              debugText = 'Pinch End\nEhrlich abstellen';
              setState(() {});
            },
            child: Stack(
              children: [
                // Nur die Chawan – groß & mittig
                Center(
                  child: ChawanWidget(state: const GameState(
                    phase: GamePhase.waitingForTapOnBowl,
                    isPlayer1Turn: true,
                    bowlOwner: BowlOwner.none,
                    fakeCount: 0,
                    winner: '',
                  )),
                ),

                // Debug-Overlay
                Positioned(
                  top: 100,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      debugText,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getZone(Offset pos, Size size) {
    final y = pos.dy / size.height;
    if (y < 0.3) return 'Oberer Bereich';
    if (y > 0.7) return 'Unterer Bereich';
    return 'Mitte (Schale)';
  }
}