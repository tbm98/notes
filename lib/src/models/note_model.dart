import 'package:json_annotation/json_annotation.dart';
import 'package:notes/src/config/enums.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.freezed.dart';

part 'note_model.g.dart';

@freezed
class NoteModel with _$NoteModel {
  const NoteModel._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory NoteModel({
    required String id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String note,
    int? alarm,
    int? time,
    @JsonKey(unknownEnumValue: NoteType.memory) required NoteType type,
    @JsonKey(defaultValue: false) @Default(false) bool finished,
    String? fbDocsId,
    @Default(false) bool movedToTrash,
  }) = _NoteModel;

  DateTime? get alarmDate {
    if (alarm == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(alarm!);
  }

  DateTime? get timeDate {
    if (time == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(time!);
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}
