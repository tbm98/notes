import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';

final todoProvider = Provider.autoDispose<NoteState>((ref) {
  final allNote = ref.watch(allNoteProvider);

  return allNote.map(data: (value) {
    return NoteState.data(
        noteModel: value.noteModel
            .where((element) => element.type == NoteType.todo)
            .toList());
  }, init: (value) {
    return value;
  });
});

final unfinishedTodoProvider = Provider.autoDispose<NoteState>((ref) {
  final todos = ref.watch(todoProvider);
  return todos.map(data: (value) {
    return NoteState.data(
        noteModel: value.noteModel
            .where((element) => element.finished == false)
            .toList());
  }, init: (value) {
    return value;
  });
});

final finishedTodoProvider = Provider.autoDispose<NoteState>((ref) {
  final todos = ref.watch(todoProvider);
  return todos.map(data: (value) {
    return NoteState.data(
        noteModel: value.noteModel
            .where((element) => element.finished == true)
            .toList());
  }, init: (value) {
    return value;
  });
});
