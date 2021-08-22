// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteStateData _$_$NoteStateDataFromJson(Map<String, dynamic> json) {
  return _$NoteStateData(
    noteModel: (json['note_model'] as List<dynamic>)
        .map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$NoteStateDataToJson(_$NoteStateData instance) =>
    <String, dynamic>{
      'note_model': instance.noteModel.map((e) => e.toJson()).toList(),
    };

_$NoteStateInit _$_$NoteStateInitFromJson(Map<String, dynamic> json) {
  return _$NoteStateInit();
}

Map<String, dynamic> _$_$NoteStateInitToJson(_$NoteStateInit instance) =>
    <String, dynamic>{};
