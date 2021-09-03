// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'compose_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComposeState _$ComposeStateFromJson(Map<String, dynamic> json) {
  return _ComposeState.fromJson(json);
}

/// @nodoc
class _$ComposeStateTearOff {
  const _$ComposeStateTearOff();

  _ComposeState call({required NoteModel noteModel}) {
    return _ComposeState(
      noteModel: noteModel,
    );
  }

  ComposeState fromJson(Map<String, Object> json) {
    return ComposeState.fromJson(json);
  }
}

/// @nodoc
const $ComposeState = _$ComposeStateTearOff();

/// @nodoc
mixin _$ComposeState {
  NoteModel get noteModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComposeStateCopyWith<ComposeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComposeStateCopyWith<$Res> {
  factory $ComposeStateCopyWith(
          ComposeState value, $Res Function(ComposeState) then) =
      _$ComposeStateCopyWithImpl<$Res>;
  $Res call({NoteModel noteModel});

  $NoteModelCopyWith<$Res> get noteModel;
}

/// @nodoc
class _$ComposeStateCopyWithImpl<$Res> implements $ComposeStateCopyWith<$Res> {
  _$ComposeStateCopyWithImpl(this._value, this._then);

  final ComposeState _value;
  // ignore: unused_field
  final $Res Function(ComposeState) _then;

  @override
  $Res call({
    Object? noteModel = freezed,
  }) {
    return _then(_value.copyWith(
      noteModel: noteModel == freezed
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel,
    ));
  }

  @override
  $NoteModelCopyWith<$Res> get noteModel {
    return $NoteModelCopyWith<$Res>(_value.noteModel, (value) {
      return _then(_value.copyWith(noteModel: value));
    });
  }
}

/// @nodoc
abstract class _$ComposeStateCopyWith<$Res>
    implements $ComposeStateCopyWith<$Res> {
  factory _$ComposeStateCopyWith(
          _ComposeState value, $Res Function(_ComposeState) then) =
      __$ComposeStateCopyWithImpl<$Res>;
  @override
  $Res call({NoteModel noteModel});

  @override
  $NoteModelCopyWith<$Res> get noteModel;
}

/// @nodoc
class __$ComposeStateCopyWithImpl<$Res> extends _$ComposeStateCopyWithImpl<$Res>
    implements _$ComposeStateCopyWith<$Res> {
  __$ComposeStateCopyWithImpl(
      _ComposeState _value, $Res Function(_ComposeState) _then)
      : super(_value, (v) => _then(v as _ComposeState));

  @override
  _ComposeState get _value => super._value as _ComposeState;

  @override
  $Res call({
    Object? noteModel = freezed,
  }) {
    return _then(_ComposeState(
      noteModel: noteModel == freezed
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ComposeState with DiagnosticableTreeMixin implements _ComposeState {
  const _$_ComposeState({required this.noteModel});

  factory _$_ComposeState.fromJson(Map<String, dynamic> json) =>
      _$_$_ComposeStateFromJson(json);

  @override
  final NoteModel noteModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ComposeState(noteModel: $noteModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ComposeState'))
      ..add(DiagnosticsProperty('noteModel', noteModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ComposeState &&
            (identical(other.noteModel, noteModel) ||
                const DeepCollectionEquality()
                    .equals(other.noteModel, noteModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(noteModel);

  @JsonKey(ignore: true)
  @override
  _$ComposeStateCopyWith<_ComposeState> get copyWith =>
      __$ComposeStateCopyWithImpl<_ComposeState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ComposeStateToJson(this);
  }
}

abstract class _ComposeState implements ComposeState {
  const factory _ComposeState({required NoteModel noteModel}) = _$_ComposeState;

  factory _ComposeState.fromJson(Map<String, dynamic> json) =
      _$_ComposeState.fromJson;

  @override
  NoteModel get noteModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ComposeStateCopyWith<_ComposeState> get copyWith =>
      throw _privateConstructorUsedError;
}
