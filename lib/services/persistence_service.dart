// lib/services/persistence_service.dart
// ────────  KONPIRA PERSISTENCE – 22.11.2025 FINAL & KOMPILIEREND  ────────

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:konpira/providers/settings_provider.dart';

class PersistenceService {
  // Ein Key für alles – modern, sauber, zukunftssicher!
  static const String _keySettings = 'konpira_settings_v2';

  /// Speichert alles als JSON-String
  static Future<void> saveAll(AppSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(settings.toJson());
    await prefs.setString(_keySettings, jsonString);
  }

  /// Lädt und gibt Map<String, dynamic>? zurück – genau wie der Provider braucht!
  static Future<Map<String, dynamic>?> loadAll() async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Neuer JSON-Key vorhanden?
    final jsonString = prefs.getString(_keySettings);
    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        return jsonDecode(jsonString) as Map<String, dynamic>;
      } catch (e) {
        print('Corrupted JSON – falling back to legacy');
      }
    }

    // 2. Legacy-Fallback: Alte einzelne Keys lesen & migrieren
    final legacy = <String, dynamic>{
      'masterVolume': prefs.getDouble('master_volume') ?? 0.8,
      'bgmVolume': prefs.getDouble('bgm_volume') ?? 0.6,
      'voiceEnabled': true,
      'sfxVolume': prefs.getDouble('sfx_volume') ?? 1.0,
      'hapticsIntensity': prefs.getInt('haptics_intensity') ?? 2,
      'timingWindowMs': prefs.getInt('timing_window_ms') ?? 80,
      'maxFakesInARow': (prefs.getInt('max_fakes_in_a_row') ?? 2).clamp(1, 3),
      'aiDifficulty': prefs.getInt('ai_difficulty') ?? 3,
      'animationIntensity': prefs.getDouble('animation_intensity') ?? 1.0,
      'theme': prefs.getInt('app_theme') ?? 0,
      'playersFaceEachOther': prefs.getBool('players_face_each_other') ?? true,
      'gameDifficulty': prefs.getInt('game_difficulty') ?? 1, // normal
      'speedUpPerRound': prefs.getBool('speed_up_per_round') ?? false,
    };

    // Sofort migrieren → nächstes Mal ist JSON da!
    await saveAll(AppSettings.fromJson(legacy));
    return legacy;
  }
}