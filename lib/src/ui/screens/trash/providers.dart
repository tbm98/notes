import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';

class TrashNotifier extends StateNotifier<NoteState> {
  TrashNotifier(NoteState noteState) : super(noteState);

  Future<bool> emptyTrash() async {
    bool anyFail = false;
    final trashNote =
        state.map(data: (value) => value.noteModels, init: (_) => []);
    trashNote.forEach((element) async {
      final result = await getIt<Storage>().deleteNote(element);
      if (result == false) {
        anyFail = true;
      }
    });
    return anyFail == false;
  }
}

final trashProvider =
    StateNotifierProvider.autoDispose<TrashNotifier, NoteState>((ref) {
  final noteState = ref.watch(allNoteProvider).map(data: (value) {
    return NoteState.data(
        noteModels: value.noteModels
            .where((element) => element.movedToTrash == true)
            .toList());
  }, init: (value) {
    return value;
  });
  return TrashNotifier(noteState);
});
