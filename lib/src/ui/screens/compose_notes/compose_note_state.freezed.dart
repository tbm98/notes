// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'compose_note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComposeNoteState _$ComposeNoteStateFromJson(Map<String, dynamic> json) {
  return _ComposeNoteState.fromJson(json);
}

/// @nodoc
class _$ComposeNoteStateTearOff {
  const _$ComposeNoteStateTearOff();

  _ComposeNoteState call({required NoteModel noteModel}) {
    return _ComposeNoteState(
      noteModel: noteModel,
    );
  }

  ComposeNoteState fromJson(Map<String, Object> json) {
    return ComposeNoteState.fromJson(json);
  }
}

/// @nodoc
const $ComposeNoteState = _$ComposeNoteStateTearOff();

/// @nodoc
mixin _$ComposeNoteState {
  NoteModel get noteModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComposeNoteStateCopyWith<ComposeNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComposeNoteStateCopyWith<$Res> {
  factory $ComposeNoteStateCopyWith(
          ComposeNoteState value, $Res Function(ComposeNoteState) then) =
      _$ComposeNoteStateCopyWithImpl<$Res>;
  $Res call({NoteModel noteModel});

  $NoteModelCopyWith<$Res> get noteModel;
}

/// @nodoc
class _$ComposeNoteStateCopyWithImpl<$Res>
    implements $ComposeNoteStateCopyWith<$Res> {
  _$ComposeNoteStateCopyWithImpl(this._value, this._then);

  final ComposeNoteState _value;
  // ignore: unused_field
  final $Res Function(ComposeNoteState) _then;

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
abstract class _$ComposeNoteStateCopyWith<$Res>
    implements $ComposeNoteStateCopyWith<$Res> {
  factory _$ComposeNoteStateCopyWith(
          _ComposeNoteState value, $Res Function(_ComposeNoteState) then) =
      __$ComposeNoteStateCopyWithImpl<$Res>;
  @override
  $Res call({NoteModel noteModel});

  @override
  $NoteModelCopyWith<$Res> get noteModel;
}

/// @nodoc
class __$ComposeNoteStateCopyWithImpl<$Res>
    extends _$ComposeNoteStateCopyWithImpl<$Res>
    implements _$ComposeNoteStateCopyWith<$Res> {
  __$ComposeNoteStateCopyWithImpl(
      _ComposeNoteState _value, $Res Function(_ComposeNoteState) _then)
      : super(_value, (v) => _then(v as _ComposeNoteState));

  @override
  _ComposeNoteState get _value => super._value as _ComposeNoteState;

  @override
  $Res call({
    Object? noteModel = freezed,
  }) {
    return _then(_ComposeNoteState(
      noteModel: noteModel == freezed
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ComposeNoteState
    with DiagnosticableTreeMixin
    implements _ComposeNoteState {
  const _$_ComposeNoteState({required this.noteModel});

  factory _$_ComposeNoteState.fromJson(Map<String, dynamic> json) =>
      _$_$_ComposeNoteStateFromJson(json);

  @override
  final NoteModel noteModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ComposeNoteState(noteModel: $noteModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ComposeNoteState'))
      ..add(DiagnosticsProperty('noteModel', noteModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ComposeNoteState &&
            (identical(other.noteModel, noteModel) ||
                const DeepCollectionEquality()
                    .equals(other.noteModel, noteModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(noteModel);

  @JsonKey(ignore: true)
  @override
  _$ComposeNoteStateCopyWith<_ComposeNoteState> get copyWith =>
      __$ComposeNoteStateCopyWithImpl<_ComposeNoteState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ComposeNoteStateToJson(this);
  }
}

abstract class _ComposeNoteState implements ComposeNoteState {
  const factory _ComposeNoteState({required NoteModel noteModel}) =
      _$_ComposeNoteState;

  factory _ComposeNoteState.fromJson(Map<String, dynamic> json) =
      _$_ComposeNoteState.fromJson;

  @override
  NoteModel get noteModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ComposeNoteStateCopyWith<_ComposeNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}
