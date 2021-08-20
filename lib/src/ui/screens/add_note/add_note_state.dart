import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/config/global_constant.dart';
import 'package:notes/src/models/note_model.dart';

part 'add_note_state.freezed.dart';

part 'add_note_state.g.dart';

@freezed
class AddNoteState with _$AddNoteState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AddNoteState({
    required NoteModel noteModel,
  }) = _AddNoteState;

  factory AddNoteState.init(NoteType type) => AddNoteState(
      noteModel: NoteModel(id: uuid.v4(), title: '', note: '', type: type));

  factory AddNoteState.fromJson(Map<String, dynamic> json) =>
      _$AddNoteStateFromJson(json);
}
