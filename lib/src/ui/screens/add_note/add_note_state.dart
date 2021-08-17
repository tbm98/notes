import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_note_state.freezed.dart';

part 'add_note_state.g.dart';

@freezed
class AddNoteState with _$AddNoteState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AddNoteState({
    required String title,
    required String note,
    DateTime? date,
    DateTime? alarm,
  }) = _AddNoteState;

  factory AddNoteState.init() => const AddNoteState(title: '', note: '');

  factory AddNoteState.fromJson(Map<String, dynamic> json) =>
      _$AddNoteStateFromJson(json);
}
