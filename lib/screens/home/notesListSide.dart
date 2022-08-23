import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
import 'package:notes/utils/priorityListView.dart';
import 'package:provider/provider.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class NotesListSide extends StatelessWidget {
  const NotesListSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<List<Notes>>(context);
    List<Notes>? notes_1 = [], notes_2 = [], notes_3 = [];
    notes.forEach(
      (ele) {
        if (ele.priority == 1) {
          notes_1.add(ele);
        } else if (ele.priority == 2) {
          notes_2.add(ele);
        } else {
          notes_3.add(ele);
        }
      },
    );

    ;
    return PageView(
      children: [
        PriorityListView(
          notes: notes_1,
          priority: 1,
        ),
        PriorityListView(
          notes: notes_2,
          priority: 2,
        ),
        PriorityListView(
          notes: notes_3,
          priority: 3,
        ),
      ],
    );
  }
}
