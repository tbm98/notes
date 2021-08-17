// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddNoteState _$_$_AddNoteStateFromJson(Map<String, dynamic> json) {
  return _$_AddNoteState(
    title: json['title'] as String,
    note: json['note'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    alarm:
        json['alarm'] == null ? null : DateTime.parse(json['alarm'] as String),
  );
}

Map<String, dynamic> _$_$_AddNoteStateToJson(_$_AddNoteState instance) =>
    <String, dynamic>{
      'title': instance.title,
      'note': instance.note,
      'date': instance.date?.toIso8601String(),
      'alarm': instance.alarm?.toIso8601String(),
    };
