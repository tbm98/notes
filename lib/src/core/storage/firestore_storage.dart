import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/models/note_model.dart';

class FirestoreStorage extends Storage {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<bool> addNote(NoteModel noteModel) async {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = firestore.collection('notes');
    // Call the user's CollectionReference to add a new user
    try {
      await users.add(noteModel.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteNote(NoteModel noteModel) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAllNote() async {
    final querySnapshot = await firestore
        .collection('notes')
        .orderBy('time', descending: true)
        .get();
    return querySnapshot.docs
        .map((e) => NoteModel.fromJson(e.data()).copyWith(fbDocsId: e.id))
        .toList();
  }

  @visibleForTesting
  List<NoteModel> mapQuerySnapshotToListNode(
    QuerySnapshot<Map<String, dynamic>> snapshot,
  ) {
    return snapshot.docs
        .map((e) => NoteModel.fromJson(e.data()).copyWith(fbDocsId: e.id))
        .toList();
  }

  @override
  Stream<List<NoteModel>> allNoteStream() {
    return firestore
        .collection('notes')
        .orderBy('time', descending: true)
        .snapshots()
        .map(mapQuerySnapshotToListNode);
  }

  @override
  Future<bool> updateNote(NoteModel noteModel) async {
    try {
      await firestore
          .collection('notes')
          .doc(noteModel.fbDocsId)
          .update(noteModel.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }
}
