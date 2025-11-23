// lib/services/beat_engine.dart

import 'dart:async';
import 'package:flutter/foundation.dart';

class BeatState {
  final int currentBpm;
  final int beatCount;
  final bool isRunning;

  const BeatState({
    required this.currentBpm,
    required this.beatCount,
    required this.isRunning,
  });

  factory BeatState.initial() => const BeatState(
        currentBpm: 0,
        beatCount: 0,
        isRunning: false,
      );

  BeatState copyWith({
    int? currentBpm,
    int? beatCount,
    bool? isRunning,
  }) {
    return BeatState(
      currentBpm: currentBpm ?? this.currentBpm,
      beatCount: beatCount ?? this.beatCount,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}

class BeatEngine extends ChangeNotifier {
  BeatState _state = BeatState.initial();
  Timer? _beatTimer;
  bool _disposed = false;

  void Function()? onBeat;

  BeatState get state => _state;

  // ★★★★★ UMGEBAUT: Akzeptiert jetzt einen optionalen Offset ★★★★★
  void start(int bpm, {Duration offset = Duration.zero}) {
    _beatTimer?.cancel();

    final intervalMs = (60000 / bpm).round();
    final interval = Duration(milliseconds: intervalMs);

    _state = BeatState(
      currentBpm: bpm,
      beatCount: 0,
      isRunning: true,
    );
    _safeNotifyListeners();
    debugPrint('🥁 BeatEngine will start: $bpm BPM with offset ${offset.inMilliseconds}ms');

    // Timer für den initialen Offset
    _beatTimer = Timer(offset, () {
      if (_disposed) return;

      // Ersten Beat sofort auslösen
      _state = _state.copyWith(beatCount: 1);
      _safeNotifyListeners();
      onBeat?.call();
      debugPrint('🥁 Beat #${_state.beatCount} @ ${_state.currentBpm} BPM (first beat after offset)');

      // Periodischen Timer für alle folgenden Beats starten
      _beatTimer = Timer.periodic(
        interval,
        (_) {
          if (_disposed) {
            _beatTimer?.cancel();
            return;
          }

          _state = _state.copyWith(beatCount: _state.beatCount + 1);
          _safeNotifyListeners();
          onBeat?.call();
          // debugPrint('🥁 Beat #${_state.beatCount} @ ${_state.currentBpm} BPM'); // Optional: für weniger Lärm auskommentieren
        },
      );
    });
  }

  void updateBpm(int newBpm) {
    if (!_state.isRunning || _disposed) return;

    final intervalMs = (60000 / newBpm).round();

    _state = _state.copyWith(currentBpm: newBpm);
    _safeNotifyListeners();

    _beatTimer?.cancel();
    _beatTimer = Timer.periodic(
      Duration(milliseconds: intervalMs),
      (_) {
        if (_disposed) {
          _beatTimer?.cancel();
          return;
        }

        _state = _state.copyWith(beatCount: _state.beatCount + 1);
        _safeNotifyListeners();
        onBeat?.call();
        debugPrint('🥁 Beat #${_state.beatCount} @ ${_state.currentBpm} BPM');
      },
    );

    debugPrint('⚡ BeatEngine Speed-Up: $newBpm BPM (${intervalMs}ms)');
  }

  void stop() {
    _beatTimer?.cancel();
    _state = _state.copyWith(isRunning: false);
    _safeNotifyListeners();
    debugPrint('🛑 BeatEngine gestoppt');
  }

  void _safeNotifyListeners() {
    if (!_disposed && hasListeners) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _beatTimer?.cancel();
    super.dispose();
    debugPrint('🗑️ BeatEngine disposed');
  }
}