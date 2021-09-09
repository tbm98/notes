import 'package:flutter_test/flutter_test.dart';
import 'package:notes/src/config/enums.dart';
import 'package:notes/src/models/note_model.dart';

void main() {
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
  });
}
