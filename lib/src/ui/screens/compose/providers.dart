import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/home/providers/tab_providers.dart';

import 'compose_state.dart';

class ComposeStateNotifier extends StateNotifier<ComposeState> {
  ComposeStateNotifier({
    required ComposeState oldState,
    this.ref,
  }) : super(oldState);

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
  NoteModel? composeResult() {
    if (state.noteModel.title.isEmpty && state.noteModel.note.isEmpty) {
      return null;
    }

    if (state.noteModel.time == null) {
      state = state.copyWith(
          noteModel: state.noteModel
              .copyWith(time: DateTime.now().millisecondsSinceEpoch));
    }

    // if todos => set time = now
    if (state.noteModel.type == NoteType.todo) {
      return state.noteModel
          .copyWith(time: DateTime.now().millisecondsSinceEpoch);
    }
    // if memory => set alarm = null
    else {
      return state.noteModel.copyWith(alarm: null);
    }
  }
}

final composePreferTypeProvider = StateProvider<NoteType>((ref) {
  final currentTab = ref.watch(currentTabProvider).state;

  return currentTab == 0 ? NoteType.todo : NoteType.memory;
});

final composeProvider =
    StateNotifierProvider.autoDispose<ComposeStateNotifier, ComposeState>(
        (ref) {
  final preferType = ref.watch(composePreferTypeProvider).state;
  return ComposeStateNotifier(
    oldState: ComposeState.init(preferType),
    ref: ref,
  );
});
