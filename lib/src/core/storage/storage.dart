import 'package:notes/src/models/note_model.dart';

abstract class Storage {
  Future<void> addNote(NoteModel noteModel);

  Future<bool> deleteNote(String id);

  Future<List<NoteModel>> getAllNote();

  Stream<List<NoteModel>> allNoteStream();

}
