// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteModel _$_$_NoteModelFromJson(Map<String, dynamic> json) {
  return _$_NoteModel(
    id: json['id'] as String,
    title: json['title'] as String? ?? '',
    subTitle: json['sub_title'] as String? ?? '',
    alarm: json['alarm'] as int?,
    time: json['time'] as int?,
    type: _$enumDecode(_$NoteTypeEnumMap, json['type'],
        unknownValue: NoteType.memory),
    finished: json['finished'] as bool? ?? false,
    fbDocsId: json['fb_docs_id'] as String?,
    movedToTrash: json['moved_to_trash'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_NoteModelToJson(_$_NoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'alarm': instance.alarm,
      'time': instance.time,
      'type': _$NoteTypeEnumMap[instance.type],
      'finished': instance.finished,
      'fb_docs_id': instance.fbDocsId,
      'moved_to_trash': instance.movedToTrash,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$NoteTypeEnumMap = {
  NoteType.todo: 'todo',
  NoteType.memory: 'memory',
};
