import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';

final trashProvider = Provider.autoDispose<NoteState>((ref) {
  final allNote = ref.watch(allNoteProvider);

  return allNote.map(data: (value) {
    return NoteState.data(
        noteModel: value.noteModel
            .where((element) => element.movedToTrash == true)
            .toList());
  }, init: (value) {
    return value;
  });
});
