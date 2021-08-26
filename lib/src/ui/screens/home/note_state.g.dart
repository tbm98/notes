// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteStateData _$_$NoteStateDataFromJson(Map<String, dynamic> json) {
  return _$NoteStateData(
    noteModels: (json['note_models'] as List<dynamic>)
        .map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$NoteStateDataToJson(_$NoteStateData instance) =>
    <String, dynamic>{
      'note_models': instance.noteModels.map((e) => e.toJson()).toList(),
    };

_$NoteStateInit _$_$NoteStateInitFromJson(Map<String, dynamic> json) {
  return _$NoteStateInit();
}

Map<String, dynamic> _$_$NoteStateInitToJson(_$NoteStateInit instance) =>
    <String, dynamic>{};
