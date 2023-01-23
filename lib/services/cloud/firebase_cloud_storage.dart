import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/services/cloud/cloud_note.dart';
import 'package:flutterapp/services/cloud/cloud_storage_constants.dart';
import 'package:flutterapp/services/cloud/cloud_storage_exceptions.dart';

class FireBaseCloudStorage {
  final notes = FirebaseFirestore.instance.collection('notes');

  //Deleting notes
  Future<void> deleteNote({required String documentId}) async {
    try {
      await notes.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteNoteExceptions();
    }
  }

  //Updating existing notes
  Future<void> updateNote({
    required String documentId,
    required String text,
  }) async {
    try {
      await notes.doc(documentId).update({textFieldName: text});
    } catch (e) {
      throw CouldNotUpdateNoteExceptions();
    }
  }

  //snaphots updates all the changes that are happening live from the notes
  Stream<Iterable<CloudNote>> allNotes({required String ownerUserId}) =>
      notes.snapshots().map(
          (event) => event.docs.map((doc) => CloudNote.fromSnapshot(doc)).where(
                (note) => note.ownerUserId == ownerUserId,
              ));

  //getting notes by user id
  Future<Iterable<CloudNote>> getNotes({required String ownerUserId}) async {
    try {
      return await notes
          .where(
            ownerUserIdFieldName,
            isEqualTo: ownerUserId,
          )
          .get()
          .then(
            (value) => value.docs.map(
              (doc) {
                return CloudNote(
                  documentId: doc.id,
                  ownerUserId: doc.data()[ownerUserIdFieldName] as String,
                  text: doc.data()[textFieldName] as String,
                );
              },
            ),
          );
    } catch (e) {
      throw CouldNotGetAllNotesException();
    }
  }

  //create a new note
  void createNewNote({required String ownerUserId}) async {
    await notes.add({
      ownerUserIdFieldName: ownerUserId,
      textFieldName: '',
    });
  }

  //make firebase cloud storage singleton
  static final FireBaseCloudStorage _shared =
      FireBaseCloudStorage._internalInstance();
  FireBaseCloudStorage._internalInstance();

  factory FireBaseCloudStorage() => _shared;
}
