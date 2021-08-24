import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/add_note/add_note_state.dart';
import 'package:notes/src/ui/screens/home/providers/note_providers.dart';
import 'package:notes/src/ui/screens/home/providers/tab_providers.dart';

class AddNoteStateNotifier extends StateNotifier<AddNoteState> {
  AddNoteStateNotifier({required NoteType type, this.ref})
      : super(AddNoteState.init(type));

  final ProviderRefBase? ref;

  void changedTitle(String value) => state = state.copyWith(
        noteModel: state.noteModel.copyWith(
          title: value,
        ),
      );

  void changedNote(String value) => state = state.copyWith(
        noteModel: state.noteModel.copyWith(
          note: value,
        ),
      );

  void datePicked(DateTime? dateTime) => state = state.copyWith(
        noteModel: state.noteModel.copyWith(
          time: dateTime?.millisecondsSinceEpoch,
        ),
      );

  void alarmPicked(DateTime? dateTime) => state = state.copyWith(
        noteModel: state.noteModel.copyWith(
          alarm: dateTime?.millisecondsSinceEpoch,
        ),
      );

  void toggleType() {
    final currentType = state.noteModel.type;
    final newType =
        currentType == NoteType.todo ? NoteType.memory : NoteType.todo;
    state = state.copyWith(noteModel: state.noteModel.copyWith(type: newType));
  }

  /// return a note to save to storage, if title and note is empty => return null
  NoteModel? prepareForAddNote() {
    if (state.noteModel.title.isEmpty && state.noteModel.note.isEmpty) {
      return null;
    }
    if (state.noteModel.time == null) {
      return state.noteModel
          .copyWith(time: DateTime.now().millisecondsSinceEpoch);
    }
    return state.noteModel;
  }

  Future<void> saveNote(NoteModel noteModel) async {
    await getIt<Storage>().addNote(noteModel);
  }
}

final addNotePreferTypeProvider = StateProvider<NoteType>((ref) {
  final currentTab = ref.watch(currentTabProvider).state;

  return currentTab == 0 ? NoteType.todo : NoteType.memory;
});

final addNoteProvider =
    StateNotifierProvider.autoDispose<AddNoteStateNotifier, AddNoteState>(
        (ref) {
  final preferType = ref.watch(addNotePreferTypeProvider).state;
  return AddNoteStateNotifier(type: preferType, ref: ref);
});
