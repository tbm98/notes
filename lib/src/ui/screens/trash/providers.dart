import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';

class TrashNotifier extends StateNotifier<List<NoteState>?> {
  TrashNotifier(List<NoteState>? noteStates) : super(noteStates);

  Future<bool> emptyTrash() async {
    bool anyFail = false;
    state?.forEach((element) async {
      final result = await getIt<Storage>().deleteNote(element.noteModel);
      if (result == false) {
        anyFail = true;
      }
    });
    return anyFail == false;
  }
}

final trashProvider =
    StateNotifierProvider.autoDispose<TrashNotifier, List<NoteState>?>((ref) {
  final noteState = ref.watch(allNoteProvider);
  return TrashNotifier(noteState
      ?.where((element) => element.noteModel.movedToTrash == true)
      .toList());
});
