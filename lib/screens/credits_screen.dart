// lib/screens/credits_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konpira/providers/settings_provider.dart';

class CreditsScreen extends ConsumerWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(settingsProvider).theme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Credits', style: TextStyle(color: Color(0xFF4A3728), fontSize: 28)),
        centerTitle: true,
      ),
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
  child: SafeArea(
    child: Stack(
      children: [
        // <<< Titel-PNG absolut oben – exakt wie auf HomeScreen (top: -20 = unter AppBar!)
        Positioned(
          top: -56,  // <<< schiebt es hoch – passt perfekt unter die AppBar!
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/konpira_title.png',
            height: 180,
            fit: BoxFit.contain,
          ),
        ),

        // Credits-Text zentriert, mit etwas mehr Platz oben (wegen Titel-PNG)
        Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(  // <<< Overflow fixxed!
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),  // Platz für Titel-PNG
                const Text(
                  'Idee, Design & Code:\nZiegelbrenner29\n\n'
                  'Inspiration:\nKonpira fune fune – das echte Pilgerlied aus Shikoku\n\n'
                  'Danke an alle Teemeister, die mich zum Lachen gebracht haben! 🍵\n\n'
                  'Version 1.0 – 2025\n\n'
                  '© wienold-it – Alle Rechte vorbehalten.',
                  style: TextStyle(fontSize: 18, height: 1.8, color: Color(0xFF4A3728)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                Text(
                  'Namaste & いただきます！',
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Color(0xFF4A3728).withOpacity(0.8)),
                ),
              ],
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