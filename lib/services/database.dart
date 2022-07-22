import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/notes.dart';

class Database {
  final String? uid;

  Database({this.uid});

  //Collection
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('notes');

  Stream<List<Notes>> get notes {
    return ref.snapshots().map(notesFromSnapshot);
  }

  //List of notes from snapshots

  List<Notes> notesFromSnapshot(QuerySnapshot s) {
    return s.docs.map((e) {
      return Notes(
        info: e.get('info') ?? '',
        priority: e.get('priority') ?? 1,
      );
    }).toList();
  }

  //Update the data present
  Future update(String info, int priority) async {
    return await ref.doc(uid).set(
      {
        'info': info,
        'priority': priority,
      },
    );
  }
}
