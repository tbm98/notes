import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';

class AllNoteNotifier extends StateNotifier<NoteState> {
  StreamSubscription? _allNoteStreamSubscription;

  AllNoteNotifier() : super(const NoteState.init()) {
    init();
  }

  void init() {
    _allNoteStreamSubscription =
        getIt<Storage>().allNoteStream().listen((event) {
      state = NoteState.data(noteModel: event);
    });
  }

  /// for cancel subscription when dispose if need
  void onDispose() {
    _allNoteStreamSubscription?.cancel();
    state = const NoteState.init();
  }

  Future<void> getAllNote() async {
    state = NoteState.data(noteModel: await getIt<Storage>().getAllNote());
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

final todoNoteProvider = Provider.autoDispose<NoteState>((ref) {
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

final memoriesNoteProvider = Provider.autoDispose<NoteState>((ref) {
  final allNote = ref.watch(allNoteProvider);

  return allNote.map(data: (value) {
    return NoteState.data(
        noteModel: value.noteModel
            .where((element) => element.type == NoteType.memory)
            .toList());
  }, init: (value) {
    return value;
  });
});
