// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteState _$$_NoteStateFromJson(Map<String, dynamic> json) => _$_NoteState(
      noteModel: NoteModel.fromJson(json['note_model'] as Map<String, dynamic>),
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_NoteStateToJson(_$_NoteState instance) =>
    <String, dynamic>{
      'note_model': instance.noteModel.toJson(),
      'selected': instance.selected,
    };
