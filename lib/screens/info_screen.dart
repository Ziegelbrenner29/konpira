// lib/screens/info_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konpira/providers/settings_provider.dart';

class InfoScreen extends ConsumerWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(settingsProvider).theme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Spielregeln & Infos', style: TextStyle(color: Color(0xFF4A3728), fontSize: 28)),
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
              // ★★★★★ EINHEITLICHER TITEL – GENAU WIE AUF SETTINGS & HOME! ★★★★★
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'assets/images/konpira_title.png',
                    height: 80,        // kleiner + edler – passt perfekt zu Settings
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Inhalt nach unten schieben – Titel hat Platz
              Padding(
                padding: const EdgeInsets.only(top: 80), // exakt wie Settings & Home
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      // ================== SPIELREGELN ==================
                      const Text('Spielregeln', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF4A3728))),
                      const SizedBox(height: 16),
                      const Text(
                        'Konpira fune fune ist ein traditionelles japanisches Trinkspiel aus Shikoku, basierend auf dem Pilgerlied zum Kotohira-gū-Schrein (Konpira-san).\n\n'
                        'Zwei Spieler klopfen abwechselnd auf Tisch oder Schale im Rhythmus des Gesangs – wer das Timing verpasst oder falsch klopft, verliert!\n\n'
                        'In Konpira:\n'
                        '• Ein-Finger-Tap → tok / pon\n'
                        '• Zwei-Finger-Double-Tap → DON!\n'
                        '• Pinch / LongPress → Schale hochheben + Fake-Out (max. 2x)\n\n'
                        'Der Verlierer trinkt die Schale Matcha leer – oder wird gezwungen! 🍵\n\n'
                        '„Hoi-hoi!“ – viel Spaß beim Pilgern!',
                        style: TextStyle(fontSize: 18, height: 1.6, color: Color(0xFF4A3728)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      // ================== INFOS ZUM LIED ==================
                      const Text('Infos zum Lied', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF4A3728))),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset('assets/images/tempel_tafel.jpg', height: 300, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '„Konpira fune fune“ ist ein uraltes Pilgerlied (vor 1900), das jeder Japaner kennt. Es wurde von Pilgern gesungen, die zum Kotohira-gū-Schrein auf dem Elefanten-Kopf-Berg wollten.\n\n'
                        'Der Text erzählt von der Reise, Wind und Dankbarkeit – und ist bis heute lebendiges Kulturgut.\n\n'
                        'Diese App trägt dieses wichtige Stück japanischer Tradition in die Welt – damit die Teezeremonie und das Lied nie vergessen werden.',
                        style: TextStyle(fontSize: 18, height: 1.6, color: Color(0xFF4A3728)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      // ================== TEE-ZEREMONIE ==================
                      const Text('Tee-Zeremonie', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF4A3728))),
                      const SizedBox(height: 16),
                      const Text(
                        'Die japanische Teezeremonie (Chanoyu) ist eine der höchsten Formen der Gastfreundschaft. Geiko und Maiko in Kyoto spielen Konpira fune fune traditionell mit Gästen – ein Zeichen von Vertrauen und Freude.\n\n'
                        'Dieses Spiel ist nicht nur Spaß – es ist lebendiges Kulturgut, das Achtsamkeit, Rhythmus und Gemeinschaft feiert.\n\n'
                        'Mit Konpira bringen wir dieses Erbe auf dein Handy – damit die Welt die Schönheit der japanischen Kultur neu entdeckt.',
                        style: TextStyle(fontSize: 18, height: 1.6, color: Color(0xFF4A3728)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 80),
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