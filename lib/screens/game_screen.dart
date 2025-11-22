// lib/screens/game_screen.dart
// ────────  KONPIRA GAME SCREEN – 22.11.2025 MIT PVP-INDIKATOREN!  ────────

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konpira/widgets/chawan_widget.dart';
import 'package:konpira/providers/settings_provider.dart';
import 'package:konpira/providers/bgm_provider.dart';
import 'package:konpira/providers/game_provider.dart';
import 'package:konpira/models/game_state.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> with TickerProviderStateMixin {
  String debugText = 'Bereit – teste Gesten!';
  double lastContactSize = 0.0;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
      ..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bgmProvider).setGameScreen(true);
    });

    ref.read(gameProvider.notifier).startKonpiraSong();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    ref.read(gameProvider.notifier).stopKonpiraSong();
    ref.read(bgmProvider).setGameScreen(false);
    super.dispose();
  }

  String get tableAsset => switch (ref.watch(settingsProvider).theme) {
        AppTheme.washiClassic  => 'assets/images/themes/table_washi.jpg',
        AppTheme.matchaGarden  => 'assets/images/themes/table_garden.jpg',
        AppTheme.goldenTemple  => 'assets/images/themes/table_temple.jpg',
      };

  // ─────── NEU: Indikator-Asset je Theme (Platzhalter → später Claudes Kunstwerke!) ───────
  String getIndicatorAsset(AppTheme theme) => switch (theme) {
        AppTheme.washiClassic => 'assets/images/indicators/lampion.png',       // ← Claude: roter Lampion
        AppTheme.matchaGarden => 'assets/images/indicators/sakura.png',        // ← Claude: fallende Sakura
        AppTheme.goldenTemple => 'assets/images/indicators/temple_bell.png',   // ← Claude: goldene Glocke
      };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final settings = ref.watch(settingsProvider);
    final gameState = ref.watch(gameProvider);
    final isPlayerOneTurn = gameState.isPlayer1Turn;
    final faceEachOther = settings.playersFaceEachOther;

    return PopScope(
      onPopInvoked: (didPop) async {
        if (didPop) {
          ref.read(gameProvider.notifier).stopKonpiraSong();
          await ref.read(bgmProvider).setGameScreen(false);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(settings.theme.paperAsset),
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
              lastContactSize = event.size;
              setState(() {});
            },
            child: Stack(
              children: [
                // Tisch
                Center(
                  child: Image.asset(
                    tableAsset,
                    width: size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),

                // Chawan
                const Center(child: ChawanWidget()),

                // ─────── PVP-INDIKATOREN (oben/unten oder links/rechts + 180°!) ───────
                _PlayerTurnIndicator(
                  isActive: isPlayerOneTurn,
                  alignment: faceEachOther ? Alignment.bottomLeft : Alignment.topLeft,
                  rotation: 0,
                  asset: getIndicatorAsset(settings.theme),
                  pulseController: _pulseController,
                  animationIntensity: settings.animationIntensity,
                ),

                _PlayerTurnIndicator(
                  isActive: !isPlayerOneTurn,
                  alignment: faceEachOther ? Alignment.topRight : Alignment.topRight,
                  rotation: faceEachOther ? 180 : 0,  // ← 180° bei gegenüber!
                  asset: getIndicatorAsset(settings.theme),
                  pulseController: _pulseController,
                  animationIntensity: settings.animationIntensity,
                ),

                // Game Over Button
                if (gameState.phase == GamePhase.gameOver)
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(gameProvider.notifier).resetGame();
                        ref.read(gameProvider.notifier).startKonpiraSong();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 24),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      ),
                      child: const Text('Nochmal!', style: TextStyle(fontSize: 32, color: Colors.white)),
                    ),
                  ),

                // Debug
                Positioned(
                  bottom: 80,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Kontakt: ${lastContactSize.round()} px²',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
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
}

// ─────── NEUES WIDGET: PULSIERENDER INDIKATOR MIT 180°-DREHUNG ───────
class _PlayerTurnIndicator extends StatelessWidget {
  final bool isActive;
  final Alignment alignment;
  final double rotation; // in Grad
  final String asset;
  final AnimationController pulseController;
  final double animationIntensity;

  const _PlayerTurnIndicator({
    required this.isActive,
    required this.alignment,
    required this.rotation,
    required this.asset,
    required this.pulseController,
    required this.animationIntensity,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final indicatorSize = size.width * 0.2; // ~20% der Breite

    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.08), // Abstand zum Rand
        child: AnimatedBuilder(
          animation: pulseController,
          builder: (context, child) {
            final pulseValue = isActive ? (0.95 + pulseController.value * 0.1) * animationIntensity : 0.8;
            final opacity = isActive ? 1.0 : 0.4;

            return Opacity(
              opacity: opacity,
              child: Transform.rotate(
                angle: rotation * 3.14159 / 180, // Grad → Radiant
                child: Transform.scale(
                  scale: pulseValue,
                  child: Container(
                    width: indicatorSize,
                    height: indicatorSize,
                    decoration: BoxDecoration(
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.6),
                                blurRadius: 20,
                                spreadRadius: 5,
                              )
                            ]
                          : null,
                    ),
                    child: Image.asset(
                      asset,
                      fit: BoxFit.contain,
                      // Platzhalter, falls Asset noch fehlt:
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.circle,
                        size: indicatorSize,
                        color: isActive ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}