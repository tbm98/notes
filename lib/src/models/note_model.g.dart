// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteModel _$_$_NoteModelFromJson(Map<String, dynamic> json) {
  return _$_NoteModel(
    id: json['id'] as String,
    title: json['title'] as String? ?? '',
    note: json['note'] as String? ?? '',
    alarm: json['alarm'] as int?,
    time: json['time'] as int?,
    type: _$enumDecode(_$NoteTypeEnumMap, json['type'],
        unknownValue: NoteType.memory),
  );
}

Map<String, dynamic> _$_$_NoteModelToJson(_$_NoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'note': instance.note,
      'alarm': instance.alarm,
      'time': instance.time,
      'type': _$NoteTypeEnumMap[instance.type],
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
