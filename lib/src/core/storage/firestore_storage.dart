import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/src/core/auth/auth.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/models/note_model.dart';

class FirestoreStorage extends Storage {
  FirestoreStorage({required this.auth});

  final Auth auth;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get collection =>
      firestore.collection(auth.currentUser.getEmail!);

  @override
  Future<bool> addNote(NoteModel noteModel) async {
    try {
      await collection.add(noteModel.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteNote(NoteModel noteModel) async {
    try {
      await collection.doc(noteModel.fbDocsId).delete();
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<NoteModel>> getAllNote() async {
    final querySnapshot =
        await collection.orderBy('time', descending: true).get();
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
    return collection
        .orderBy('time', descending: true)
        .snapshots()
        .map(mapQuerySnapshotToListNode);
  }

  @override
  Future<bool> updateNote(NoteModel noteModel) async {
    try {
      await collection.doc(noteModel.fbDocsId).update(noteModel.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteAccount() async {
    try {
      var snapshots = await collection.get();
      for (var doc in snapshots.docs) {
        await doc.reference.delete();
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
