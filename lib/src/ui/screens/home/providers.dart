import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/models/note_model.dart';

final currentTabProvider = StateProvider<int>((ref) {
  return 0;
});

class AllNoteNotifier extends StateNotifier<List<NoteModel>> {
  late final StreamSubscription _allNoteStreamSubscription;

  AllNoteNotifier() : super([]) {
    _allNoteStreamSubscription =
        getIt<Storage>().allNoteStream().listen((event) {
      state = event;
    });
  }

  /// for cancel subscription when dispose if need
  void onDispose() {
    _allNoteStreamSubscription.cancel();
  }

  Future<void> getAllNote() async {
    state = await getIt<Storage>().getAllNote();
  }
}

final allNoteProvider =
    StateNotifierProvider<AllNoteNotifier, List<NoteModel>>((ref) {
  return AllNoteNotifier();
});

final todoNoteProvider = Provider<List<NoteModel>>((ref) {
  final allNote = ref.watch(allNoteProvider);

  return allNote.where((element) => element.type == NoteType.todo).toList();
});

final memoriesNoteProvider = Provider<List<NoteModel>>((ref) {
  final allNote = ref.watch(allNoteProvider);

  return allNote.where((element) => element.type == NoteType.memory).toList();
});
