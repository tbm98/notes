import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/config/global_constant.dart';
import 'package:notes/src/models/note_model.dart';

part 'compose_state.freezed.dart';

part 'compose_state.g.dart';

@freezed
class ComposeState with _$ComposeState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ComposeState({
    required NoteModel noteModel,
  }) = _ComposeState;

  factory ComposeState.init(NoteType type) => ComposeState(
      noteModel: NoteModel(id: uuid.v4(), title: '', note: '', type: type));

  factory ComposeState.fromJson(Map<String, dynamic> json) =>
      _$ComposeStateFromJson(json);
}
