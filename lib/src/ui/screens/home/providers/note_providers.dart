import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';

class AllNoteNotifier extends StateNotifier<List<NoteState>?> {
  StreamSubscription? _allNoteStreamSubscription;

  AllNoteNotifier() : super(null) {
    init();
  }

  void init() {
    _allNoteStreamSubscription =
        getIt<Storage>().allNoteStream().listen((event) {
      state = event.map((e) => NoteState(noteModel: e)).toList();
    });
  }

  /// for cancel subscription when dispose if need
  void onDispose() {
    _allNoteStreamSubscription?.cancel();
    state = null;
  }

  Future<bool> updateNote(NoteModel noteModel) async {
    return await getIt<Storage>().updateNote(noteModel);
  }
}

final allNoteProvider =
    StateNotifierProvider.autoDispose<AllNoteNotifier, List<NoteState>?>((ref) {
  final allNoteNotifier = AllNoteNotifier();

  ref.onDispose(() {
    allNoteNotifier.onDispose();
  });

  return allNoteNotifier;
});
