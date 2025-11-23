// lib/providers/bgm_provider.dart  ← komplett so überschreiben!

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'settings_provider.dart';  // ← dein Provider mit AppTheme

final bgmProvider = Provider<BgmPlayer>((ref) => BgmPlayer(ref));

class BgmPlayer {
  final Ref ref;
  late final AudioPlayer _player = AudioPlayer()..setLoopMode(LoopMode.one);
  bool _isGameScreen = false;

  BgmPlayer(this.ref);

  String getAssetForTheme(AppTheme theme) => switch (theme) {   // ← AppTheme statt ThemeType
    AppTheme.washiClassic  => 'assets/audio/bgm/washi_classic.mp3',
    AppTheme.matchaGarden  => 'assets/audio/bgm/matcha_garden.mp3',
    AppTheme.goldenTemple  => 'assets/audio/bgm/golden_temple.mp3',
  };

  Future<void> updateThemeAndPlayIfAllowed() async {
    final settings = ref.read(settingsProvider);
    final volume = settings.bgmVolume;

    try {
      await _player.stop();
      await _player.setAsset(getAssetForTheme(settings.theme));
      await _player.setVolume(volume);
      if (!_isGameScreen) await _player.play();
    } catch (e) {
      debugPrint('BGM Error: $e');
    }
  }

  Future<void> setGameScreen(bool isActive) async {
    _isGameScreen = isActive;
    if (isActive) {
      await _player.pause();                 // sofort leise im Spiel
    } else {
      await updateThemeAndPlayIfAllowed();   // wieder an + richtiges Theme
    } 
  }
  
  Future<void> updateVolume(double volume) async {
    await _player.setVolume(volume);
    //ref.read(settingsProvider.notifier).updateBgmVolume(volume); // optional: sync zurück
  }
  
  void dispose() => _player.dispose();
}