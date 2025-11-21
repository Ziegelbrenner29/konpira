// lib/services/persistence_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:konpira/providers/settings_provider.dart';

class PersistenceService {
  static const String _keyTheme = 'app_theme';
  static const String _keyMasterVol = 'master_volume';
  static const String _keyBgmVol = 'bgm_volume';
  static const String _keySfxVol = 'sfx_volume';
  static const String _keyHaptics = 'haptics_intensity';
  static const String _keyTiming = 'timing_window_ms';
  static const String _keyMaxFakes = 'max_fakes_in_a_row';
  static const String _keyAiDiff = 'ai_difficulty';
  static const String _keyAnim = 'animation_intensity';

  static Future<void> saveAll(AppSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyTheme, settings.theme.index);
    await prefs.setDouble(_keyMasterVol, settings.masterVolume);
    await prefs.setDouble(_keyBgmVol, settings.bgmVolume);
    await prefs.setDouble(_keySfxVol, settings.sfxVolume);
    await prefs.setInt(_keyHaptics, settings.hapticsIntensity);
    await prefs.setInt(_keyTiming, settings.timingWindowMs);
    await prefs.setInt(_keyMaxFakes, settings.maxFakesInARow);
    await prefs.setInt(_keyAiDiff, settings.aiDifficulty);
    await prefs.setDouble(_keyAnim, settings.animationIntensity);
  }

  static Future<AppSettings> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = AppTheme.values[prefs.getInt(_keyTheme) ?? 0];
    return AppSettings(
      masterVolume: prefs.getDouble(_keyMasterVol) ?? 0.8,
      bgmVolume: prefs.getDouble(_keyBgmVol) ?? 0.6,
      sfxVolume: prefs.getDouble(_keySfxVol) ?? 1.0,
      hapticsIntensity: prefs.getInt(_keyHaptics) ?? 2,
      timingWindowMs: prefs.getInt(_keyTiming) ?? 80,
      maxFakesInARow: prefs.getInt(_keyMaxFakes) ?? 2,
      aiDifficulty: prefs.getInt(_keyAiDiff) ?? 3,
      animationIntensity: prefs.getDouble(_keyAnim) ?? 1.0,
      theme: theme,
    );
  }
}