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
  switch (json['runtimeType'] as String) {
    case 'data':
      return NoteStateData.fromJson(json);
    case 'init':
      return NoteStateInit.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$NoteStateTearOff {
  const _$NoteStateTearOff();

  NoteStateData data({required List<NoteModel> noteModels}) {
    return NoteStateData(
      noteModels: noteModels,
    );
  }

  NoteStateInit init() {
    return const NoteStateInit();
  }

  NoteState fromJson(Map<String, Object> json) {
    return NoteState.fromJson(json);
  }
}

/// @nodoc
const $NoteState = _$NoteStateTearOff();

/// @nodoc
mixin _$NoteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NoteModel> noteModels) data,
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NoteModel> noteModels)? data,
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoteStateData value) data,
    required TResult Function(NoteStateInit value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoteStateData value)? data,
    TResult Function(NoteStateInit value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStateCopyWith<$Res> {
  factory $NoteStateCopyWith(NoteState value, $Res Function(NoteState) then) =
      _$NoteStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteStateCopyWithImpl<$Res> implements $NoteStateCopyWith<$Res> {
  _$NoteStateCopyWithImpl(this._value, this._then);

  final NoteState _value;
  // ignore: unused_field
  final $Res Function(NoteState) _then;
}

/// @nodoc
abstract class $NoteStateDataCopyWith<$Res> {
  factory $NoteStateDataCopyWith(
          NoteStateData value, $Res Function(NoteStateData) then) =
      _$NoteStateDataCopyWithImpl<$Res>;
  $Res call({List<NoteModel> noteModels});
}

/// @nodoc
class _$NoteStateDataCopyWithImpl<$Res> extends _$NoteStateCopyWithImpl<$Res>
    implements $NoteStateDataCopyWith<$Res> {
  _$NoteStateDataCopyWithImpl(
      NoteStateData _value, $Res Function(NoteStateData) _then)
      : super(_value, (v) => _then(v as NoteStateData));

  @override
  NoteStateData get _value => super._value as NoteStateData;

  @override
  $Res call({
    Object? noteModels = freezed,
  }) {
    return _then(NoteStateData(
      noteModels: noteModels == freezed
          ? _value.noteModels
          : noteModels // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$NoteStateData with DiagnosticableTreeMixin implements NoteStateData {
  const _$NoteStateData({required this.noteModels});

  factory _$NoteStateData.fromJson(Map<String, dynamic> json) =>
      _$_$NoteStateDataFromJson(json);

  @override
  final List<NoteModel> noteModels;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoteState.data(noteModels: $noteModels)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NoteState.data'))
      ..add(DiagnosticsProperty('noteModels', noteModels));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NoteStateData &&
            (identical(other.noteModels, noteModels) ||
                const DeepCollectionEquality()
                    .equals(other.noteModels, noteModels)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(noteModels);

  @JsonKey(ignore: true)
  @override
  $NoteStateDataCopyWith<NoteStateData> get copyWith =>
      _$NoteStateDataCopyWithImpl<NoteStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NoteModel> noteModels) data,
    required TResult Function() init,
  }) {
    return data(noteModels);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NoteModel> noteModels)? data,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(noteModels);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoteStateData value) data,
    required TResult Function(NoteStateInit value) init,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoteStateData value)? data,
    TResult Function(NoteStateInit value)? init,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$NoteStateDataToJson(this)..['runtimeType'] = 'data';
  }
}

abstract class NoteStateData implements NoteState {
  const factory NoteStateData({required List<NoteModel> noteModels}) =
      _$NoteStateData;

  factory NoteStateData.fromJson(Map<String, dynamic> json) =
      _$NoteStateData.fromJson;

  List<NoteModel> get noteModels => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteStateDataCopyWith<NoteStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStateInitCopyWith<$Res> {
  factory $NoteStateInitCopyWith(
          NoteStateInit value, $Res Function(NoteStateInit) then) =
      _$NoteStateInitCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteStateInitCopyWithImpl<$Res> extends _$NoteStateCopyWithImpl<$Res>
    implements $NoteStateInitCopyWith<$Res> {
  _$NoteStateInitCopyWithImpl(
      NoteStateInit _value, $Res Function(NoteStateInit) _then)
      : super(_value, (v) => _then(v as NoteStateInit));

  @override
  NoteStateInit get _value => super._value as NoteStateInit;
}

/// @nodoc
@JsonSerializable()
class _$NoteStateInit with DiagnosticableTreeMixin implements NoteStateInit {
  const _$NoteStateInit();

  factory _$NoteStateInit.fromJson(Map<String, dynamic> json) =>
      _$_$NoteStateInitFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoteState.init()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'NoteState.init'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoteStateInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NoteModel> noteModels) data,
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NoteModel> noteModels)? data,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoteStateData value) data,
    required TResult Function(NoteStateInit value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoteStateData value)? data,
    TResult Function(NoteStateInit value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$NoteStateInitToJson(this)..['runtimeType'] = 'init';
  }
}

abstract class NoteStateInit implements NoteState {
  const factory NoteStateInit() = _$NoteStateInit;

  factory NoteStateInit.fromJson(Map<String, dynamic> json) =
      _$NoteStateInit.fromJson;
}
