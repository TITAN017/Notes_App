import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: use_key_in_widget_constructors

class NoteCard extends StatelessWidget {
  final Color _cardColor;
  final String _content;

  const NoteCard(this._cardColor, this._content);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: _cardColor,
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
              _content,
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
                splashColor: _cardColor,
                color: Colors.black,
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ],
          )
        ],
      ),
    );
  }
}
