// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  GamePhase get phase => throw _privateConstructorUsedError;
  bool get isPlayer1Turn => throw _privateConstructorUsedError;
  BowlOwner get bowlOwner => throw _privateConstructorUsedError;
  int get fakeCount => throw _privateConstructorUsedError;
  String get winner => throw _privateConstructorUsedError;

  /// Serializes this GameState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {GamePhase phase,
      bool isPlayer1Turn,
      BowlOwner bowlOwner,
      int fakeCount,
      String winner});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? isPlayer1Turn = null,
    Object? bowlOwner = null,
    Object? fakeCount = null,
    Object? winner = null,
  }) {
    return _then(_value.copyWith(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as GamePhase,
      isPlayer1Turn: null == isPlayer1Turn
          ? _value.isPlayer1Turn
          : isPlayer1Turn // ignore: cast_nullable_to_non_nullable
              as bool,
      bowlOwner: null == bowlOwner
          ? _value.bowlOwner
          : bowlOwner // ignore: cast_nullable_to_non_nullable
              as BowlOwner,
      fakeCount: null == fakeCount
          ? _value.fakeCount
          : fakeCount // ignore: cast_nullable_to_non_nullable
              as int,
      winner: null == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GamePhase phase,
      bool isPlayer1Turn,
      BowlOwner bowlOwner,
      int fakeCount,
      String winner});
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phase = null,
    Object? isPlayer1Turn = null,
    Object? bowlOwner = null,
    Object? fakeCount = null,
    Object? winner = null,
  }) {
    return _then(_$GameStateImpl(
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as GamePhase,
      isPlayer1Turn: null == isPlayer1Turn
          ? _value.isPlayer1Turn
          : isPlayer1Turn // ignore: cast_nullable_to_non_nullable
              as bool,
      bowlOwner: null == bowlOwner
          ? _value.bowlOwner
          : bowlOwner // ignore: cast_nullable_to_non_nullable
              as BowlOwner,
      fakeCount: null == fakeCount
          ? _value.fakeCount
          : fakeCount // ignore: cast_nullable_to_non_nullable
              as int,
      winner: null == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateImpl implements _GameState {
  const _$GameStateImpl(
      {required this.phase,
      required this.isPlayer1Turn,
      required this.bowlOwner,
      required this.fakeCount,
      required this.winner});

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  @override
  final GamePhase phase;
  @override
  final bool isPlayer1Turn;
  @override
  final BowlOwner bowlOwner;
  @override
  final int fakeCount;
  @override
  final String winner;

  @override
  String toString() {
    return 'GameState(phase: $phase, isPlayer1Turn: $isPlayer1Turn, bowlOwner: $bowlOwner, fakeCount: $fakeCount, winner: $winner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.isPlayer1Turn, isPlayer1Turn) ||
                other.isPlayer1Turn == isPlayer1Turn) &&
            (identical(other.bowlOwner, bowlOwner) ||
                other.bowlOwner == bowlOwner) &&
            (identical(other.fakeCount, fakeCount) ||
                other.fakeCount == fakeCount) &&
            (identical(other.winner, winner) || other.winner == winner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, phase, isPlayer1Turn, bowlOwner, fakeCount, winner);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(
      this,
    );
  }
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {required final GamePhase phase,
      required final bool isPlayer1Turn,
      required final BowlOwner bowlOwner,
      required final int fakeCount,
      required final String winner}) = _$GameStateImpl;

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override
  GamePhase get phase;
  @override
  bool get isPlayer1Turn;
  @override
  BowlOwner get bowlOwner;
  @override
  int get fakeCount;
  @override
  String get winner;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
