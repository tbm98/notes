import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';

final notTrashProvider = Provider.autoDispose<List<NoteState>?>((ref) {
  final allNote = ref.watch(allNoteProvider);

  return allNote
      ?.where((element) => element.noteModel.movedToTrash == false)
      .toList();
});

final todoProvider = Provider.autoDispose<List<NoteState>?>((ref) {
  final allNote = ref.watch(notTrashProvider);
  return allNote
      ?.where((element) => element.noteModel.type == NoteType.todo)
      .toList();
});

final unfinishedTodoProvider = Provider.autoDispose<List<NoteState>?>((ref) {
  final todos = ref.watch(todoProvider);

  return todos
      ?.where((element) => element.noteModel.finished == false)
      .toList();
});

final finishedTodoProvider = Provider.autoDispose<List<NoteState>?>((ref) {
  final todos = ref.watch(todoProvider);
  return todos?.where((element) => element.noteModel.finished == true).toList();
});
