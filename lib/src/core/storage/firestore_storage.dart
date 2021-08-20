import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/src/core/storage/storage.dart';
import 'package:notes/src/models/note_model.dart';

class FirestoreStorage extends Storage {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addNote(NoteModel noteModel) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = firestore.collection('notes');
    // Call the user's CollectionReference to add a new user
    return users
        .add(noteModel.toJson())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Future<bool> deleteNote(String id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAllNote() async {
    final querySnapshot = await firestore.collection('notes').get();
    return querySnapshot.docs.map((e) => NoteModel.fromJson(e.data())).toList();
  }

  @visibleForTesting
  List<NoteModel> mapQuerySnapshotToListNode(
    QuerySnapshot<Map<String, dynamic>> snapshot,
  ) {
    return snapshot.docs.map((e) => NoteModel.fromJson(e.data())).toList();
  }

  @override
  Stream<List<NoteModel>> allNoteStream() {
    return firestore
        .collection('notes')
        .snapshots()
        .map(mapQuerySnapshotToListNode);
  }
}
