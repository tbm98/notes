import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';
import 'package:notes/src/ui/screens/todo/providers.dart';

final memoriesNoteProvider = Provider.autoDispose<List<NoteState>?>((ref) {
  final allNote = ref.watch(notTrashProvider);

  return allNote
      ?.where((element) => element.noteModel.type == NoteType.memory)
      .toList();
});
