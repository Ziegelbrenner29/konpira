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
  double lastContactSize = 0.0;

  String get tableAsset => switch (ref.watch(settingsProvider).theme) {
        AppTheme.washiClassic  => 'assets/images/themes/table_washi.jpg',
        AppTheme.matchaGarden  => 'assets/images/themes/table_garden.jpg',
        AppTheme.goldenTemple  => 'assets/images/themes/table_temple.jpg',
      };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ref.watch(settingsProvider).theme.paperAsset),
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
              // ★★★★★ TISCH – 100% BREITE, EXAKT MITTIG (Mitte = Mitte der Schale) ★★★★★
              Center(
                child: Image.asset(
                  tableAsset,
                  width: size.width,           // voller Bildschirm links/rechts
                  fit: BoxFit.fitWidth,        // kein Verzerren, nur skalieren
                  alignment: Alignment.center,  // Mittelpunkt des Bildes = Mittelpunkt des Screens
                ),
              ),

              // ★★★★★ CHAWAN – steht perfekt auf dem Tischmittelpunkt ★★★★★
              const Center(
                child: ChawanWidget(state: GameState(
                  phase: GamePhase.waitingForTapOnBowl,
                  isPlayer1Turn: true,
                  bowlOwner: BowlOwner.none,
                  fakeCount: 0,
                  winner: '',
                )),
              ),

              // Debug-Overlay (unten rechts)
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
                    'Kontaktfläche: ${lastContactSize.round()} px²',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}