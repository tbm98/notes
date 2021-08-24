import 'package:notes/src/models/note_model.dart';

abstract class Storage {
  Future<bool> addNote(NoteModel noteModel);

  Future<bool> deleteNote(NoteModel noteModel);

  Future<bool> updateNote(NoteModel noteModel);

  Future<List<NoteModel>> getAllNote();

  Stream<List<NoteModel>> allNoteStream();
}
