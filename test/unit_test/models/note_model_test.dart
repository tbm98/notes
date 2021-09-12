import 'package:flutter_test/flutter_test.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/models/note_model.dart';

void main() {
  test('test NoteModel toJson/fromJson', () {
    final noteModel = NoteModel.fromJson(
        const NoteModel(id: '1', title: '', subTitle: '', type: NoteType.memory)
            .toJson());
    expect(noteModel.id, '1');
    expect(noteModel.title, '');
    expect(noteModel.subTitle, '');
    expect(noteModel.type, NoteType.memory);
    expect(noteModel.alarm, null);
    expect(noteModel.alarmDate, null);
    expect(noteModel.time, null);
    expect(noteModel.timeDate, null);
    expect(noteModel.finished, false);
    expect(noteModel.fbDocsId, null);
    expect(noteModel.movedToTrash, false);
  });

  test('test NoteModel mininal value', () {
    const noteModel =
        NoteModel(id: '1', title: '', subTitle: '', type: NoteType.memory);
    expect(noteModel.id, '1');
    expect(noteModel.title, '');
    expect(noteModel.subTitle, '');
    expect(noteModel.type, NoteType.memory);
    expect(noteModel.alarm, null);
    expect(noteModel.alarmDate, null);
    expect(noteModel.time, null);
    expect(noteModel.timeDate, null);
    expect(noteModel.finished, false);
    expect(noteModel.fbDocsId, null);
    expect(noteModel.movedToTrash, false);
  });

  test('test NoteModel has time and alarm', () {
    final time = DateTime.now();
    final alarm = time.add(const Duration(seconds: 1));
    final noteModel = NoteModel(
      id: '1',
      title: '',
      subTitle: '',
      type: NoteType.memory,
      time: time.millisecondsSinceEpoch,
      alarm: alarm.millisecondsSinceEpoch,
    );
    expect(noteModel.id, '1');
    expect(noteModel.title, '');
    expect(noteModel.subTitle, '');
    expect(noteModel.type, NoteType.memory);
    expect(noteModel.alarm, alarm.millisecondsSinceEpoch);
    expect(noteModel.alarmDate?.millisecondsSinceEpoch,
        alarm.millisecondsSinceEpoch);
    expect(noteModel.time, time.millisecondsSinceEpoch);
    expect(noteModel.timeDate?.millisecondsSinceEpoch,
        time.millisecondsSinceEpoch);
    expect(noteModel.finished, false);
    expect(noteModel.fbDocsId, null);
    expect(noteModel.movedToTrash, false);
    expect(noteModel.notificationId, time.millisecondsSinceEpoch % 1000);
  });
}
