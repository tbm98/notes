// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      @JsonKey(defaultValue: '') required String subTitle,
      int? alarm,
      int? time,
      @JsonKey(unknownEnumValue: NoteType.memory) required NoteType type,
      @JsonKey(defaultValue: false) bool finished = false,
      String? fbDocsId,
      bool movedToTrash = false}) {
    return _NoteModel(
      id: id,
      title: title,
      subTitle: subTitle,
      alarm: alarm,
      time: time,
      type: type,
      finished: finished,
      fbDocsId: fbDocsId,
      movedToTrash: movedToTrash,
    );
  }

  NoteModel fromJson(Map<String, Object?> json) {
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
  String get subTitle => throw _privateConstructorUsedError;
  int? get alarm => throw _privateConstructorUsedError;
  int? get time => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: NoteType.memory)
  NoteType get type => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get finished => throw _privateConstructorUsedError;
  String? get fbDocsId => throw _privateConstructorUsedError;
  bool get movedToTrash => throw _privateConstructorUsedError;

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
      @JsonKey(defaultValue: '') String subTitle,
      int? alarm,
      int? time,
      @JsonKey(unknownEnumValue: NoteType.memory) NoteType type,
      @JsonKey(defaultValue: false) bool finished,
      String? fbDocsId,
      bool movedToTrash});
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
    Object? subTitle = freezed,
    Object? alarm = freezed,
    Object? time = freezed,
    Object? type = freezed,
    Object? finished = freezed,
    Object? fbDocsId = freezed,
    Object? movedToTrash = freezed,
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
      subTitle: subTitle == freezed
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
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
      movedToTrash: movedToTrash == freezed
          ? _value.movedToTrash
          : movedToTrash // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @JsonKey(defaultValue: '') String subTitle,
      int? alarm,
      int? time,
      @JsonKey(unknownEnumValue: NoteType.memory) NoteType type,
      @JsonKey(defaultValue: false) bool finished,
      String? fbDocsId,
      bool movedToTrash});
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
    Object? subTitle = freezed,
    Object? alarm = freezed,
    Object? time = freezed,
    Object? type = freezed,
    Object? finished = freezed,
    Object? fbDocsId = freezed,
    Object? movedToTrash = freezed,
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
      subTitle: subTitle == freezed
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
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
      movedToTrash: movedToTrash == freezed
          ? _value.movedToTrash
          : movedToTrash // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_NoteModel extends _NoteModel with DiagnosticableTreeMixin {
  const _$_NoteModel(
      {required this.id,
      @JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: '') required this.subTitle,
      this.alarm,
      this.time,
      @JsonKey(unknownEnumValue: NoteType.memory) required this.type,
      @JsonKey(defaultValue: false) this.finished = false,
      this.fbDocsId,
      this.movedToTrash = false})
      : super._();

  factory _$_NoteModel.fromJson(Map<String, dynamic> json) =>
      _$$_NoteModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String title;
  @override
  @JsonKey(defaultValue: '')
  final String subTitle;
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
  @JsonKey(defaultValue: false)
  @override
  final bool movedToTrash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoteModel(id: $id, title: $title, subTitle: $subTitle, alarm: $alarm, time: $time, type: $type, finished: $finished, fbDocsId: $fbDocsId, movedToTrash: $movedToTrash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NoteModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subTitle', subTitle))
      ..add(DiagnosticsProperty('alarm', alarm))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('finished', finished))
      ..add(DiagnosticsProperty('fbDocsId', fbDocsId))
      ..add(DiagnosticsProperty('movedToTrash', movedToTrash));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.alarm, alarm) || other.alarm == alarm) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.finished, finished) ||
                other.finished == finished) &&
            (identical(other.fbDocsId, fbDocsId) ||
                other.fbDocsId == fbDocsId) &&
            (identical(other.movedToTrash, movedToTrash) ||
                other.movedToTrash == movedToTrash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, subTitle, alarm, time,
      type, finished, fbDocsId, movedToTrash);

  @JsonKey(ignore: true)
  @override
  _$NoteModelCopyWith<_NoteModel> get copyWith =>
      __$NoteModelCopyWithImpl<_NoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteModelToJson(this);
  }
}

abstract class _NoteModel extends NoteModel {
  const factory _NoteModel(
      {required String id,
      @JsonKey(defaultValue: '') required String title,
      @JsonKey(defaultValue: '') required String subTitle,
      int? alarm,
      int? time,
      @JsonKey(unknownEnumValue: NoteType.memory) required NoteType type,
      @JsonKey(defaultValue: false) bool finished,
      String? fbDocsId,
      bool movedToTrash}) = _$_NoteModel;
  const _NoteModel._() : super._();

  factory _NoteModel.fromJson(Map<String, dynamic> json) =
      _$_NoteModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: '')
  String get subTitle;
  @override
  int? get alarm;
  @override
  int? get time;
  @override
  @JsonKey(unknownEnumValue: NoteType.memory)
  NoteType get type;
  @override
  @JsonKey(defaultValue: false)
  bool get finished;
  @override
  String? get fbDocsId;
  @override
  bool get movedToTrash;
  @override
  @JsonKey(ignore: true)
  _$NoteModelCopyWith<_NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
