import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';
import 'package:notes/src/ui/screens/todo/providers.dart';

final memoriesNoteProvider = Provider.autoDispose<NoteState>((ref) {
  final allNote = ref.watch(notTrashProvider);

  return allNote.map(data: (value) {
    return NoteState.data(
        noteModels: value.noteModels
            .where((element) => element.type == NoteType.memory)
            .toList());
  }, init: (value) {
    return value;
  });
});
