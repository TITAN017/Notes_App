import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/services/database.dart';
import 'package:notes/utils/note_card.dart';
import 'package:provider/provider.dart';

class NotesList extends StatefulWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<List<Notes>?>(context);
    final user = Provider.of<MyUser?>(context);

    final Database db = Database(uid: user!.uid);

    if (notes != null) {
      return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          var current = notes[index];
          return NoteCard(
            cardColor: current.priority,
            info: current.info,
            id: current.id,
            del: db.delete,
            mod: db.modify,
          );
        },
      );
    } else {
      return Container();
    }
  }
}
