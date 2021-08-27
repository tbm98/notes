// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteState _$NoteStateFromJson(Map<String, dynamic> json) {
  return _NoteState.fromJson(json);
}

/// @nodoc
class _$NoteStateTearOff {
  const _$NoteStateTearOff();

  _NoteState call({required NoteModel noteModel, bool selected = false}) {
    return _NoteState(
      noteModel: noteModel,
      selected: selected,
    );
  }

  NoteState fromJson(Map<String, Object> json) {
    return NoteState.fromJson(json);
  }
}

/// @nodoc
const $NoteState = _$NoteStateTearOff();

/// @nodoc
mixin _$NoteState {
  NoteModel get noteModel => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteStateCopyWith<NoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStateCopyWith<$Res> {
  factory $NoteStateCopyWith(NoteState value, $Res Function(NoteState) then) =
      _$NoteStateCopyWithImpl<$Res>;
  $Res call({NoteModel noteModel, bool selected});

  $NoteModelCopyWith<$Res> get noteModel;
}

/// @nodoc
class _$NoteStateCopyWithImpl<$Res> implements $NoteStateCopyWith<$Res> {
  _$NoteStateCopyWithImpl(this._value, this._then);

  final NoteState _value;
  // ignore: unused_field
  final $Res Function(NoteState) _then;

  @override
  $Res call({
    Object? noteModel = freezed,
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      noteModel: noteModel == freezed
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$NoteStateCopyWith<$Res> implements $NoteStateCopyWith<$Res> {
  factory _$NoteStateCopyWith(
          _NoteState value, $Res Function(_NoteState) then) =
      __$NoteStateCopyWithImpl<$Res>;
  @override
  $Res call({NoteModel noteModel, bool selected});

  @override
  $NoteModelCopyWith<$Res> get noteModel;
}

/// @nodoc
class __$NoteStateCopyWithImpl<$Res> extends _$NoteStateCopyWithImpl<$Res>
    implements _$NoteStateCopyWith<$Res> {
  __$NoteStateCopyWithImpl(_NoteState _value, $Res Function(_NoteState) _then)
      : super(_value, (v) => _then(v as _NoteState));

  @override
  _NoteState get _value => super._value as _NoteState;

  @override
  $Res call({
    Object? noteModel = freezed,
    Object? selected = freezed,
  }) {
    return _then(_NoteState(
      noteModel: noteModel == freezed
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_NoteState with DiagnosticableTreeMixin implements _NoteState {
  const _$_NoteState({required this.noteModel, this.selected = false});

  factory _$_NoteState.fromJson(Map<String, dynamic> json) =>
      _$_$_NoteStateFromJson(json);

  @override
  final NoteModel noteModel;
  @JsonKey(defaultValue: false)
  @override
  final bool selected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoteState(noteModel: $noteModel, selected: $selected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NoteState'))
      ..add(DiagnosticsProperty('noteModel', noteModel))
      ..add(DiagnosticsProperty('selected', selected));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoteState &&
            (identical(other.noteModel, noteModel) ||
                const DeepCollectionEquality()
                    .equals(other.noteModel, noteModel)) &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(noteModel) ^
      const DeepCollectionEquality().hash(selected);

  @JsonKey(ignore: true)
  @override
  _$NoteStateCopyWith<_NoteState> get copyWith =>
      __$NoteStateCopyWithImpl<_NoteState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NoteStateToJson(this);
  }
}

abstract class _NoteState implements NoteState {
  const factory _NoteState({required NoteModel noteModel, bool selected}) =
      _$_NoteState;

  factory _NoteState.fromJson(Map<String, dynamic> json) =
      _$_NoteState.fromJson;

  @override
  NoteModel get noteModel => throw _privateConstructorUsedError;
  @override
  bool get selected => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NoteStateCopyWith<_NoteState> get copyWith =>
      throw _privateConstructorUsedError;
}
