// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  double get masterVolume => throw _privateConstructorUsedError;
  double get bgmVolume => throw _privateConstructorUsedError;
  bool get voiceEnabled => throw _privateConstructorUsedError;
  double get sfxVolume => throw _privateConstructorUsedError;
  int get hapticsIntensity => throw _privateConstructorUsedError;
  int get aiDifficulty => throw _privateConstructorUsedError;
  int get maxFakesInARow => throw _privateConstructorUsedError;
  int get timingWindowMs => throw _privateConstructorUsedError;
  double get animationIntensity => throw _privateConstructorUsedError;
  AppTheme get theme => throw _privateConstructorUsedError;

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {double masterVolume,
      double bgmVolume,
      bool voiceEnabled,
      double sfxVolume,
      int hapticsIntensity,
      int aiDifficulty,
      int maxFakesInARow,
      int timingWindowMs,
      double animationIntensity,
      AppTheme theme});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masterVolume = null,
    Object? bgmVolume = null,
    Object? voiceEnabled = null,
    Object? sfxVolume = null,
    Object? hapticsIntensity = null,
    Object? aiDifficulty = null,
    Object? maxFakesInARow = null,
    Object? timingWindowMs = null,
    Object? animationIntensity = null,
    Object? theme = null,
  }) {
    return _then(_value.copyWith(
      masterVolume: null == masterVolume
          ? _value.masterVolume
          : masterVolume // ignore: cast_nullable_to_non_nullable
              as double,
      bgmVolume: null == bgmVolume
          ? _value.bgmVolume
          : bgmVolume // ignore: cast_nullable_to_non_nullable
              as double,
      voiceEnabled: null == voiceEnabled
          ? _value.voiceEnabled
          : voiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sfxVolume: null == sfxVolume
          ? _value.sfxVolume
          : sfxVolume // ignore: cast_nullable_to_non_nullable
              as double,
      hapticsIntensity: null == hapticsIntensity
          ? _value.hapticsIntensity
          : hapticsIntensity // ignore: cast_nullable_to_non_nullable
              as int,
      aiDifficulty: null == aiDifficulty
          ? _value.aiDifficulty
          : aiDifficulty // ignore: cast_nullable_to_non_nullable
              as int,
      maxFakesInARow: null == maxFakesInARow
          ? _value.maxFakesInARow
          : maxFakesInARow // ignore: cast_nullable_to_non_nullable
              as int,
      timingWindowMs: null == timingWindowMs
          ? _value.timingWindowMs
          : timingWindowMs // ignore: cast_nullable_to_non_nullable
              as int,
      animationIntensity: null == animationIntensity
          ? _value.animationIntensity
          : animationIntensity // ignore: cast_nullable_to_non_nullable
              as double,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
          _$AppSettingsImpl value, $Res Function(_$AppSettingsImpl) then) =
      __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double masterVolume,
      double bgmVolume,
      bool voiceEnabled,
      double sfxVolume,
      int hapticsIntensity,
      int aiDifficulty,
      int maxFakesInARow,
      int timingWindowMs,
      double animationIntensity,
      AppTheme theme});
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
      _$AppSettingsImpl _value, $Res Function(_$AppSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masterVolume = null,
    Object? bgmVolume = null,
    Object? voiceEnabled = null,
    Object? sfxVolume = null,
    Object? hapticsIntensity = null,
    Object? aiDifficulty = null,
    Object? maxFakesInARow = null,
    Object? timingWindowMs = null,
    Object? animationIntensity = null,
    Object? theme = null,
  }) {
    return _then(_$AppSettingsImpl(
      masterVolume: null == masterVolume
          ? _value.masterVolume
          : masterVolume // ignore: cast_nullable_to_non_nullable
              as double,
      bgmVolume: null == bgmVolume
          ? _value.bgmVolume
          : bgmVolume // ignore: cast_nullable_to_non_nullable
              as double,
      voiceEnabled: null == voiceEnabled
          ? _value.voiceEnabled
          : voiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sfxVolume: null == sfxVolume
          ? _value.sfxVolume
          : sfxVolume // ignore: cast_nullable_to_non_nullable
              as double,
      hapticsIntensity: null == hapticsIntensity
          ? _value.hapticsIntensity
          : hapticsIntensity // ignore: cast_nullable_to_non_nullable
              as int,
      aiDifficulty: null == aiDifficulty
          ? _value.aiDifficulty
          : aiDifficulty // ignore: cast_nullable_to_non_nullable
              as int,
      maxFakesInARow: null == maxFakesInARow
          ? _value.maxFakesInARow
          : maxFakesInARow // ignore: cast_nullable_to_non_nullable
              as int,
      timingWindowMs: null == timingWindowMs
          ? _value.timingWindowMs
          : timingWindowMs // ignore: cast_nullable_to_non_nullable
              as int,
      animationIntensity: null == animationIntensity
          ? _value.animationIntensity
          : animationIntensity // ignore: cast_nullable_to_non_nullable
              as double,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsImpl implements _AppSettings {
  const _$AppSettingsImpl(
      {this.masterVolume = 0.8,
      this.bgmVolume = 0.6,
      this.voiceEnabled = true,
      this.sfxVolume = 1.0,
      this.hapticsIntensity = 2,
      this.aiDifficulty = 3,
      this.maxFakesInARow = 2,
      this.timingWindowMs = 80,
      this.animationIntensity = 1.0,
      this.theme = AppTheme.washiClassic});

  factory _$AppSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsImplFromJson(json);

  @override
  @JsonKey()
  final double masterVolume;
  @override
  @JsonKey()
  final double bgmVolume;
  @override
  @JsonKey()
  final bool voiceEnabled;
  @override
  @JsonKey()
  final double sfxVolume;
  @override
  @JsonKey()
  final int hapticsIntensity;
  @override
  @JsonKey()
  final int aiDifficulty;
  @override
  @JsonKey()
  final int maxFakesInARow;
  @override
  @JsonKey()
  final int timingWindowMs;
  @override
  @JsonKey()
  final double animationIntensity;
  @override
  @JsonKey()
  final AppTheme theme;

  @override
  String toString() {
    return 'AppSettings(masterVolume: $masterVolume, bgmVolume: $bgmVolume, voiceEnabled: $voiceEnabled, sfxVolume: $sfxVolume, hapticsIntensity: $hapticsIntensity, aiDifficulty: $aiDifficulty, maxFakesInARow: $maxFakesInARow, timingWindowMs: $timingWindowMs, animationIntensity: $animationIntensity, theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.masterVolume, masterVolume) ||
                other.masterVolume == masterVolume) &&
            (identical(other.bgmVolume, bgmVolume) ||
                other.bgmVolume == bgmVolume) &&
            (identical(other.voiceEnabled, voiceEnabled) ||
                other.voiceEnabled == voiceEnabled) &&
            (identical(other.sfxVolume, sfxVolume) ||
                other.sfxVolume == sfxVolume) &&
            (identical(other.hapticsIntensity, hapticsIntensity) ||
                other.hapticsIntensity == hapticsIntensity) &&
            (identical(other.aiDifficulty, aiDifficulty) ||
                other.aiDifficulty == aiDifficulty) &&
            (identical(other.maxFakesInARow, maxFakesInARow) ||
                other.maxFakesInARow == maxFakesInARow) &&
            (identical(other.timingWindowMs, timingWindowMs) ||
                other.timingWindowMs == timingWindowMs) &&
            (identical(other.animationIntensity, animationIntensity) ||
                other.animationIntensity == animationIntensity) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      masterVolume,
      bgmVolume,
      voiceEnabled,
      sfxVolume,
      hapticsIntensity,
      aiDifficulty,
      maxFakesInARow,
      timingWindowMs,
      animationIntensity,
      theme);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsImplToJson(
      this,
    );
  }
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {final double masterVolume,
      final double bgmVolume,
      final bool voiceEnabled,
      final double sfxVolume,
      final int hapticsIntensity,
      final int aiDifficulty,
      final int maxFakesInARow,
      final int timingWindowMs,
      final double animationIntensity,
      final AppTheme theme}) = _$AppSettingsImpl;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$AppSettingsImpl.fromJson;

  @override
  double get masterVolume;
  @override
  double get bgmVolume;
  @override
  bool get voiceEnabled;
  @override
  double get sfxVolume;
  @override
  int get hapticsIntensity;
  @override
  int get aiDifficulty;
  @override
  int get maxFakesInARow;
  @override
  int get timingWindowMs;
  @override
  double get animationIntensity;
  @override
  AppTheme get theme;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
