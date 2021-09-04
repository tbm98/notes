import 'package:notes/src/models/note_model.dart';

abstract class ShareHandler {
  Future<void> share(NoteModel noteModel);
}
