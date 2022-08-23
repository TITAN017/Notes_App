import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
import 'package:notes/utils/note_card.dart';
import 'package:google_fonts/google_fonts.dart';

class PriorityListView extends StatelessWidget {
  final List<Notes> notes;
  final int priority;
  const PriorityListView({required this.notes, required this.priority});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          child: Text(
            "PRIORITY : ${priority}",
            style: GoogleFonts.acme(
              fontSize: 30,
              color: Colors.yellow,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              var cur = notes[index];
              return NoteCard(
                cardColor: cur.priority,
                info: cur.info,
                fav: cur.fav,
                id: cur.id,
                del: () {},
                mod: () {},
                changeFav: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
