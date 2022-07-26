import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: use_key_in_widget_constructors

class NoteCard extends StatelessWidget {
  final int cardColor;
  final String info;
  final String id;
  final Function del;

  NoteCard(
      {required this.cardColor,
      required this.info,
      required this.id,
      required this.del});

  Map colors = {1: Colors.red, 2: Colors.orange, 3: Colors.green};

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: colors[cardColor],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 250,
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Text(
              info,
              style: GoogleFonts.acme(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                splashColor: colors[cardColor],
                color: Colors.black,
                onPressed: () async {
                  await del(id);
                },
                icon: Icon(Icons.close),
              ),
            ],
          )
        ],
      ),
    );
  }
}
