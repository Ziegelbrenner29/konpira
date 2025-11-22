// lib/providers/settings_provider.dart
// ────────  KONPIRA SETTINGS PROVIDER – 22.11.2025 FINAL & KOMPILIEREND  ────────

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konpira/services/persistence_service.dart';

enum AppTheme {
  washiClassic,
  matchaGarden,
  goldenTemple,
}

extension AppThemeExtension on AppTheme {
  String get paperAsset => 'assets/images/themes/paper_${index + 1}.png';
  String get bambooAsset => 'assets/images/themes/bamboo_track_${index + 1}.png';
  String get chawanAsset => switch (this) {
        AppTheme.washiClassic => 'assets/images/themes/chawan_black.png',
        AppTheme.matchaGarden => 'assets/images/themes/chawan_green.png',
        AppTheme.goldenTemple => 'assets/images/themes/chawan_beige.png',
      };

  String get displayName => switch (this) {
        AppTheme.washiClassic => '和紙古典 Washi Classic',
        AppTheme.matchaGarden => '抹茶庭園 Matcha Garden',
        AppTheme.goldenTemple => '金寺 Golden Temple',
      };
}

// ─────── Schwierigkeitsstufen für Beat-Geschwindigkeit ───────
enum GameDifficulty {
  easy,    // ~720ms – entspannt pilgern
  normal,  // ~652ms – original Konpira-Tempo
  hard;    // ~580ms – Chaos-Zen!

  double get baseBeatIntervalMs => switch (this) {
        GameDifficulty.easy => 720.0,
        GameDifficulty.normal => 652.0,
        GameDifficulty.hard => 580.0,
      };
}

class AppSettings {
  final double masterVolume;
  final double bgmVolume;
  final bool voiceEnabled;
  final double sfxVolume;
  final int hapticsIntensity;
  final int aiDifficulty;
  final int maxFakesInARow;
  final int timingWindowMs;
  final double animationIntensity;
  final AppTheme theme;

  // ★★★★★ NEUE EINSTELLUNGEN (2025 Originalgetreu) ★★★★★
  final bool playersFaceEachOther;      // true = gegenüber (echtes Spiel!)
  final GameDifficulty gameDifficulty; // easy / normal / hard
  final bool speedUpPerRound;           // Chaos-Zen-Beschleunigung

  const AppSettings({
    this.masterVolume = 0.8,
    this.bgmVolume = 0.6,
    this.voiceEnabled = true,
    this.sfxVolume = 1.0,
    this.hapticsIntensity = 2,
    this.aiDifficulty = 3,
    this.maxFakesInARow = 2,
    this.timingWindowMs = 80,
    this.animationIntensity = 1.0,
    this.theme = AppTheme.washiClassic,
    this.playersFaceEachOther = true,     // Original: gegenüber sitzen
    this.gameDifficulty = GameDifficulty.normal,
    this.speedUpPerRound = false,
  });

  AppSettings copyWith({
    double? masterVolume,
    double? bgmVolume,
    bool? voiceEnabled,
    double? sfxVolume,
    int? hapticsIntensity,
    int? aiDifficulty,
    int? maxFakesInARow,
    int? timingWindowMs,
    double? animationIntensity,
    AppTheme? theme,
    bool? playersFaceEachOther,
    GameDifficulty? gameDifficulty,
    bool? speedUpPerRound,
  }) {
    return AppSettings(
      masterVolume: masterVolume ?? this.masterVolume,
      bgmVolume: bgmVolume ?? this.bgmVolume,
      voiceEnabled: voiceEnabled ?? this.voiceEnabled,
      sfxVolume: sfxVolume ?? this.sfxVolume,
      hapticsIntensity: hapticsIntensity ?? this.hapticsIntensity,
      aiDifficulty: aiDifficulty ?? this.aiDifficulty,
      maxFakesInARow: maxFakesInARow ?? this.maxFakesInARow,
      timingWindowMs: timingWindowMs ?? this.timingWindowMs,
      animationIntensity: animationIntensity ?? this.animationIntensity,
      theme: theme ?? this.theme,
      playersFaceEachOther: playersFaceEachOther ?? this.playersFaceEachOther,
      gameDifficulty: gameDifficulty ?? this.gameDifficulty,
      speedUpPerRound: speedUpPerRound ?? this.speedUpPerRound,
    );
  }

  // JSON für Persistence
  Map<String, dynamic> toJson() => {
        'masterVolume': masterVolume,
        'bgmVolume': bgmVolume,
        'voiceEnabled': voiceEnabled,
        'sfxVolume': sfxVolume,
        'hapticsIntensity': hapticsIntensity,
        'aiDifficulty': aiDifficulty,
        'maxFakesInARow': maxFakesInARow,
        'timingWindowMs': timingWindowMs,
        'animationIntensity': animationIntensity,
        'theme': theme.index,
        'playersFaceEachOther': playersFaceEachOther,
        'gameDifficulty': gameDifficulty.index,
        'speedUpPerRound': speedUpPerRound,
      };

  factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
        masterVolume: json['masterVolume'] as double? ?? 0.8,
        bgmVolume: json['bgmVolume'] as double? ?? 0.6,
        voiceEnabled: json['voiceEnabled'] as bool? ?? true,
        sfxVolume: json['sfxVolume'] as double? ?? 1.0,
        hapticsIntensity: json['hapticsIntensity'] as int? ?? 2,
        aiDifficulty: json['aiDifficulty'] as int? ?? 3,
        maxFakesInARow: (json['maxFakesInARow'] as int? ?? 2).clamp(1, 3),
        timingWindowMs: json['timingWindowMs'] as int? ?? 80,
        animationIntensity: json['animationIntensity'] as double? ?? 1.0,
        theme: AppTheme.values[json['theme'] as int? ?? 0],
        playersFaceEachOther: json['playersFaceEachOther'] as bool? ?? true,
        gameDifficulty: GameDifficulty.values[json['gameDifficulty'] as int? ?? 1],
        speedUpPerRound: json['speedUpPerRound'] as bool? ?? false,
      );
}

// ★★★★★ DER EINE NOTIFIER – ALLES PERSISTENT ★★★★★
class SettingsNotifier extends StateNotifier<AppSettings> {
  SettingsNotifier(AppSettings initial) : super(initial);

  static Future<SettingsNotifier> create() async {
    final savedJson = await PersistenceService.loadAll();
    final saved = savedJson != null ? AppSettings.fromJson(savedJson) : const AppSettings();
    return SettingsNotifier(saved);
  }

  // ★★★★★ FIX: state statt state.toJson() – Persistence erwartet AppSettings! ★★★★★
  void _save() => PersistenceService.saveAll(state);

  // Alte Methoden
  void updateMasterVolume(double v) { state = state.copyWith(masterVolume: v); _save(); }
  void updateBgmVolume(double v)     { state = state.copyWith(bgmVolume: v); _save(); }
  void updateVoiceEnabled(bool v)    { state = state.copyWith(voiceEnabled: v); _save(); }
  void updateSfxVolume(double v)     { state = state.copyWith(sfxVolume: v); _save(); }
  void updateHapticsIntensity(int v) { state = state.copyWith(hapticsIntensity: v); _save(); }
  void updateTimingWindowMs(int v)   { state = state.copyWith(timingWindowMs: v); _save(); }
  void updateMaxFakesInARow(int v)   { state = state.copyWith(maxFakesInARow: v.clamp(1, 3)); _save(); }
  void updateAnimationIntensity(double v) { state = state.copyWith(animationIntensity: v); _save(); }

  void setTheme(AppTheme theme) { state = state.copyWith(theme: theme); _save(); }

  // ★★★★★ NEUE METHODEN ★★★★★
  void updatePlayersFaceEachOther(bool v) { state = state.copyWith(playersFaceEachOther: v); _save(); }
  void updateGameDifficulty(GameDifficulty difficulty) { state = state.copyWith(gameDifficulty: difficulty); _save(); }
  void updateSpeedUpPerRound(bool v) { state = state.copyWith(speedUpPerRound: v); _save(); }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, AppSettings>((ref) {
  throw UnimplementedError('Wird in main.dart mit async create überschrieben');
});