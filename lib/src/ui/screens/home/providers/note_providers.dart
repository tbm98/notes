import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/src/core/notifications/notifications.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/di/get_it.dart';
import 'package:notes/src/models/note_model.dart';
import 'package:notes/src/models/notification_model.dart';
import 'package:notes/src/ui/screens/home/note_state.dart';

class AllNoteNotifier extends StateNotifier<List<NoteState>?> {
  StreamSubscription? _allNoteStreamSubscription;

  AllNoteNotifier({
    required this.storage,
    required this.notifications,
  }) : super(null) {
    init();
  }

  final Storage storage;
  final Notifications notifications;

  void init() {
    _allNoteStreamSubscription = storage.allNoteStream().listen((event) {
      state = event.map((e) => NoteState(noteModel: e)).toList();
    });
  }

  /// for cancel subscription when dispose if need
  void onDispose() {
    _allNoteStreamSubscription?.cancel();
    state = null;
  }

  Future<bool> updateNote(NoteModel noteModel) async {
    final result = await storage.updateNote(noteModel);
    if (noteModel.movedToTrash || noteModel.finished) {
      notifications.cancelNotification(noteModel.notificationId);
    } else {
      if (noteModel.alarmDate != null) {
        notifications.cancelNotification(noteModel.notificationId);
        notifications.scheduleNotification(
            notificationModel: NotificationModel(
                id: noteModel.notificationId,
                title: noteModel.title,
                subTitle: noteModel.note),
            dateTime: noteModel.alarmDate!);
      }
    }
    return result;
  }

  Future<void> addNote(NoteModel noteModel) async {
    await storage.addNote(noteModel);
    if (noteModel.alarmDate != null) {
      notifications.scheduleNotification(
          notificationModel: NotificationModel(
              id: noteModel.notificationId,
              title: noteModel.title,
              subTitle: noteModel.note),
          dateTime: noteModel.alarmDate!);
    }
  }
}

final allNoteProvider =
    StateNotifierProvider.autoDispose<AllNoteNotifier, List<NoteState>?>((ref) {
  final allNoteNotifier = AllNoteNotifier(
    storage: getIt<Storage>(),
    notifications: getIt<Notifications>(),
  );

  ref.onDispose(() {
    allNoteNotifier.onDispose();
  });

  return allNoteNotifier;
});
