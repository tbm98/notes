import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/ui/screens/add_note/add_note_state.dart';

class AddNoteStateNotifier extends StateNotifier<AddNoteState> {
  AddNoteStateNotifier() : super(AddNoteState.init());

  void changedTitle(String value) => state = state.copyWith(title: value);

  void changedNote(String value) => state = state.copyWith(note: value);

  void datePicked(DateTime dateTime) => state = state.copyWith(date: dateTime);

  void alarmPicked(DateTime? dateTime) =>
      state = state.copyWith(alarm: dateTime);
}

final addNoteProvider =
    StateNotifierProvider.autoDispose<AddNoteStateNotifier, AddNoteState>(
        (ref) {
  return AddNoteStateNotifier();
});
