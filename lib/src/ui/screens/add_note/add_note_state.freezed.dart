// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'add_note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddNoteState _$AddNoteStateFromJson(Map<String, dynamic> json) {
  return _AddNoteState.fromJson(json);
}

/// @nodoc
class _$AddNoteStateTearOff {
  const _$AddNoteStateTearOff();

  _AddNoteState call({required NoteModel noteModel}) {
    return _AddNoteState(
      noteModel: noteModel,
    );
  }

  AddNoteState fromJson(Map<String, Object> json) {
    return AddNoteState.fromJson(json);
  }
}

/// @nodoc
const $AddNoteState = _$AddNoteStateTearOff();

/// @nodoc
mixin _$AddNoteState {
  NoteModel get noteModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddNoteStateCopyWith<AddNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNoteStateCopyWith<$Res> {
  factory $AddNoteStateCopyWith(
          AddNoteState value, $Res Function(AddNoteState) then) =
      _$AddNoteStateCopyWithImpl<$Res>;
  $Res call({NoteModel noteModel});

  $NoteModelCopyWith<$Res> get noteModel;
}

/// @nodoc
class _$AddNoteStateCopyWithImpl<$Res> implements $AddNoteStateCopyWith<$Res> {
  _$AddNoteStateCopyWithImpl(this._value, this._then);

  final AddNoteState _value;
  // ignore: unused_field
  final $Res Function(AddNoteState) _then;

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
abstract class _$AddNoteStateCopyWith<$Res>
    implements $AddNoteStateCopyWith<$Res> {
  factory _$AddNoteStateCopyWith(
          _AddNoteState value, $Res Function(_AddNoteState) then) =
      __$AddNoteStateCopyWithImpl<$Res>;
  @override
  $Res call({NoteModel noteModel});

  @override
  $NoteModelCopyWith<$Res> get noteModel;
}

/// @nodoc
class __$AddNoteStateCopyWithImpl<$Res> extends _$AddNoteStateCopyWithImpl<$Res>
    implements _$AddNoteStateCopyWith<$Res> {
  __$AddNoteStateCopyWithImpl(
      _AddNoteState _value, $Res Function(_AddNoteState) _then)
      : super(_value, (v) => _then(v as _AddNoteState));

  @override
  _AddNoteState get _value => super._value as _AddNoteState;

  @override
  $Res call({
    Object? noteModel = freezed,
  }) {
    return _then(_AddNoteState(
      noteModel: noteModel == freezed
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_AddNoteState with DiagnosticableTreeMixin implements _AddNoteState {
  const _$_AddNoteState({required this.noteModel});

  factory _$_AddNoteState.fromJson(Map<String, dynamic> json) =>
      _$_$_AddNoteStateFromJson(json);

  @override
  final NoteModel noteModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddNoteState(noteModel: $noteModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddNoteState'))
      ..add(DiagnosticsProperty('noteModel', noteModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddNoteState &&
            (identical(other.noteModel, noteModel) ||
                const DeepCollectionEquality()
                    .equals(other.noteModel, noteModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(noteModel);

  @JsonKey(ignore: true)
  @override
  _$AddNoteStateCopyWith<_AddNoteState> get copyWith =>
      __$AddNoteStateCopyWithImpl<_AddNoteState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddNoteStateToJson(this);
  }
}

abstract class _AddNoteState implements AddNoteState {
  const factory _AddNoteState({required NoteModel noteModel}) = _$_AddNoteState;

  factory _AddNoteState.fromJson(Map<String, dynamic> json) =
      _$_AddNoteState.fromJson;

  @override
  NoteModel get noteModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddNoteStateCopyWith<_AddNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}
