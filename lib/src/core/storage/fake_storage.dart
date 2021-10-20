import 'dart:async';

import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/models/note_model.dart';

class FakeStorage extends Storage {
  bool _isFirstTime = true;
  final List<NoteModel> _notes = [];
  final StreamController<List<NoteModel>> _notesController =
      StreamController<List<NoteModel>>.broadcast();

  Stream<List<NoteModel>> get _notesStream => _notesController.stream;

  Sink<List<NoteModel>> get _notesSink => _notesController.sink;

  @override
  Future<bool> addNote(NoteModel noteModel) async {
    _notes.add(noteModel);
    _notesSink.add(_notes);
    return true;
  }

  @override
  Stream<List<NoteModel>> allNoteStream() {
    // fake a data event on first time
    Future(() {
      if (_isFirstTime) {
        _notesSink.add(_notes);
      }
    });
    return _notesStream;
  }

  @override
  Future<bool> deleteAccount() async {
    _notes.clear();
    _notesSink.add(_notes);
    return true;
  }

  @override
  Future<bool> deleteNote(NoteModel noteModel) async {
    _notes.remove(noteModel);
    _notesSink.add(_notes);
    return true;
  }

  @override
  Future<List<NoteModel>> getAllNote() async {
    return _notes;
  }

  @override
  Future<bool> updateNote(NoteModel noteModel) async {
    for (int i = 0; i < _notes.length; i++) {
      if (_notes[i].id == noteModel.id) {
        _notes[i] = noteModel;
      }
    }
    _notesSink.add(_notes);
    return true;
  }
}
