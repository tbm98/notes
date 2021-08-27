import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/src/models/note_model.dart';

part 'note_state.freezed.dart';

part 'note_state.g.dart';

@freezed
class NoteState with _$NoteState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory NoteState({
    required NoteModel noteModel,
    @Default(false) bool selected,
  }) = _NoteState;

  factory NoteState.fromJson(Map<String, dynamic> json) =>
      _$NoteStateFromJson(json);
}
