// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) {
  return _NoteModel.fromJson(json);
}

/// @nodoc
class _$NoteModelTearOff {
  const _$NoteModelTearOff();

  _NoteModel call(
      {required String id,
      @JsonKey(defaultValue: '') required String title,
      @JsonKey(defaultValue: '') required String note,
      int? alarm,
      int? time,
      @JsonKey(unknownEnumValue: NoteType.memory) required NoteType type,
      @JsonKey(defaultValue: false) bool finished = false,
      String? fbDocsId}) {
    return _NoteModel(
      id: id,
      title: title,
      note: note,
      alarm: alarm,
      time: time,
      type: type,
      finished: finished,
      fbDocsId: fbDocsId,
    );
  }

  NoteModel fromJson(Map<String, Object> json) {
    return NoteModel.fromJson(json);
  }
}

/// @nodoc
const $NoteModel = _$NoteModelTearOff();

/// @nodoc
mixin _$NoteModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get note => throw _privateConstructorUsedError;
  int? get alarm => throw _privateConstructorUsedError;
  int? get time => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: NoteType.memory)
  NoteType get type => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get finished => throw _privateConstructorUsedError;
  String? get fbDocsId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteModelCopyWith<NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteModelCopyWith<$Res> {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) then) =
      _$NoteModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String note,
      int? alarm,
      int? time,
      @JsonKey(unknownEnumValue: NoteType.memory) NoteType type,
      @JsonKey(defaultValue: false) bool finished,
      String? fbDocsId});
}

/// @nodoc
class _$NoteModelCopyWithImpl<$Res> implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._value, this._then);

  final NoteModel _value;
  // ignore: unused_field
  final $Res Function(NoteModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? note = freezed,
    Object? alarm = freezed,
    Object? time = freezed,
    Object? type = freezed,
    Object? finished = freezed,
    Object? fbDocsId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      alarm: alarm == freezed
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as int?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoteType,
      finished: finished == freezed
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
      fbDocsId: fbDocsId == freezed
          ? _value.fbDocsId
          : fbDocsId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NoteModelCopyWith<$Res> implements $NoteModelCopyWith<$Res> {
  factory _$NoteModelCopyWith(
          _NoteModel value, $Res Function(_NoteModel) then) =
      __$NoteModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String note,
      int? alarm,
      int? time,
      @JsonKey(unknownEnumValue: NoteType.memory) NoteType type,
      @JsonKey(defaultValue: false) bool finished,
      String? fbDocsId});
}

/// @nodoc
class __$NoteModelCopyWithImpl<$Res> extends _$NoteModelCopyWithImpl<$Res>
    implements _$NoteModelCopyWith<$Res> {
  __$NoteModelCopyWithImpl(_NoteModel _value, $Res Function(_NoteModel) _then)
      : super(_value, (v) => _then(v as _NoteModel));

  @override
  _NoteModel get _value => super._value as _NoteModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? note = freezed,
    Object? alarm = freezed,
    Object? time = freezed,
    Object? type = freezed,
    Object? finished = freezed,
    Object? fbDocsId = freezed,
  }) {
    return _then(_NoteModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      alarm: alarm == freezed
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as int?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NoteType,
      finished: finished == freezed
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
      fbDocsId: fbDocsId == freezed
          ? _value.fbDocsId
          : fbDocsId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_NoteModel extends _NoteModel with DiagnosticableTreeMixin {
  const _$_NoteModel(
      {required this.id,
      @JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: '') required this.note,
      this.alarm,
      this.time,
      @JsonKey(unknownEnumValue: NoteType.memory) required this.type,
      @JsonKey(defaultValue: false) this.finished = false,
      this.fbDocsId})
      : super._();

  factory _$_NoteModel.fromJson(Map<String, dynamic> json) =>
      _$_$_NoteModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String title;
  @override
  @JsonKey(defaultValue: '')
  final String note;
  @override
  final int? alarm;
  @override
  final int? time;
  @override
  @JsonKey(unknownEnumValue: NoteType.memory)
  final NoteType type;
  @override
  @JsonKey(defaultValue: false)
  final bool finished;
  @override
  final String? fbDocsId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoteModel(id: $id, title: $title, note: $note, alarm: $alarm, time: $time, type: $type, finished: $finished, fbDocsId: $fbDocsId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NoteModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('alarm', alarm))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('finished', finished))
      ..add(DiagnosticsProperty('fbDocsId', fbDocsId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoteModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.alarm, alarm) ||
                const DeepCollectionEquality().equals(other.alarm, alarm)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.finished, finished) ||
                const DeepCollectionEquality()
                    .equals(other.finished, finished)) &&
            (identical(other.fbDocsId, fbDocsId) ||
                const DeepCollectionEquality()
                    .equals(other.fbDocsId, fbDocsId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(alarm) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(finished) ^
      const DeepCollectionEquality().hash(fbDocsId);

  @JsonKey(ignore: true)
  @override
  _$NoteModelCopyWith<_NoteModel> get copyWith =>
      __$NoteModelCopyWithImpl<_NoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NoteModelToJson(this);
  }
}

abstract class _NoteModel extends NoteModel {
  const factory _NoteModel(
      {required String id,
      @JsonKey(defaultValue: '') required String title,
      @JsonKey(defaultValue: '') required String note,
      int? alarm,
      int? time,
      @JsonKey(unknownEnumValue: NoteType.memory) required NoteType type,
      @JsonKey(defaultValue: false) bool finished,
      String? fbDocsId}) = _$_NoteModel;
  const _NoteModel._() : super._();

  factory _NoteModel.fromJson(Map<String, dynamic> json) =
      _$_NoteModel.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(defaultValue: '')
  String get note => throw _privateConstructorUsedError;
  @override
  int? get alarm => throw _privateConstructorUsedError;
  @override
  int? get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(unknownEnumValue: NoteType.memory)
  NoteType get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(defaultValue: false)
  bool get finished => throw _privateConstructorUsedError;
  @override
  String? get fbDocsId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NoteModelCopyWith<_NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
