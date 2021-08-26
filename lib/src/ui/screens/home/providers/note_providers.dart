import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';

class AllNoteNotifier extends StateNotifier<NoteState> {
  StreamSubscription? _allNoteStreamSubscription;

  AllNoteNotifier() : super(const NoteState.init()) {
    init();
  }

  void init() {
    _allNoteStreamSubscription =
        getIt<Storage>().allNoteStream().listen((event) {
      state = NoteState.data(noteModels: event);
    });
  }

  /// for cancel subscription when dispose if need
  void onDispose() {
    _allNoteStreamSubscription?.cancel();
    state = const NoteState.init();
  }

  Future<bool> updateNote(NoteModel noteModel) async {
    return await getIt<Storage>().updateNote(noteModel);
  }
}

final allNoteProvider =
    StateNotifierProvider.autoDispose<AllNoteNotifier, NoteState>((ref) {
  final allNoteNotifier = AllNoteNotifier();

  ref.onDispose(() {
    allNoteNotifier.onDispose();
  });

  return allNoteNotifier;
});
