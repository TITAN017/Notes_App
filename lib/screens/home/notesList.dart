import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
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

    if (notes != null) {
      return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          var current = notes[index];
          return NoteCard(cardColor: current.priority, info: current.info);
        },
      );
    } else {
      return Container();
    }
  }
}
