import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/notes.dart';

class Database {
  final String? uid;
  late CollectionReference subref;

  Database({required this.uid}) {
    subref = FirebaseFirestore.instance
        .collection('notes')
        .doc(uid)
        .collection('Notes');
  }

  //Collection
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('notes');

  Stream<List<Notes>> get notes {
    return ref.snapshots().map(notesFromSnapshot);
  }

  //Stream for subcollection documents

  Stream<List<Notes>> get userNotes {
    return subref.snapshots().map(notesFromSnapshot);
  }

  //List of notes from snapshots

  List<Notes> notesFromSnapshot(QuerySnapshot s) {
    return s.docs.map((e) {
      return Notes(
        info: e.get('info') ?? '',
        priority: e.get('priority') ?? 1,
        id: e.id,
      );
    }).toList();
  }

  //Delete the document in subcollection
  Future delete(String docid) async {
    try {
      return await subref.doc(docid).delete();
    } catch (e) {
      print("Error occured: delete");
      print(e.toString());
      return null;
    }
  }

  //Add document to subcollection
  Future add(String info, int priority) async {
    try {
      return await subref.add(
        {
          'info': info,
          'priority': priority,
        },
      );
    } catch (e) {
      print("Error occured: add");
      print(e.toString());
      return null;
    }
  }

  //Update the data present
  Future update(String info, int priority) async {
    await ref.doc(uid).set({'uid': uid});
    return await subref.doc().set(
      {
        'info': info,
        'priority': priority,
      },
    );
  }

  Future modify(String docid, String info, int priority) async {
    try {
      return await subref.doc(docid).set(
        {
          'info': info,
          'priority': priority,
        },
      );
    } catch (e) {
      print("Error occured : modify");
      print(e.toString());
      return null;
    }
  }
}
