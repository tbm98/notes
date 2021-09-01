import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/config/global_constant.dart';
import 'package:notes/src/models/note_model.dart';

part 'compose_note_state.freezed.dart';

part 'compose_note_state.g.dart';

@freezed
class ComposeNoteState with _$ComposeNoteState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ComposeNoteState({
    required NoteModel noteModel,
  }) = _ComposeNoteState;

  factory ComposeNoteState.init(NoteType type) => ComposeNoteState(
      noteModel: NoteModel(id: uuid.v4(), title: '', note: '', type: type));

  factory ComposeNoteState.fromJson(Map<String, dynamic> json) =>
      _$ComposeNoteStateFromJson(json);
}
