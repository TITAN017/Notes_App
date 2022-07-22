// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
import 'package:notes/screens/home/notesList.dart';
import 'package:notes/services/auth.dart';
import 'package:notes/services/database.dart';
import 'package:notes/utils/app_drawer.dart';
//import 'package:notes/utils/note_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  int _bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Notes>?>.value(
      value: Database().notes,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'R',
                style: GoogleFonts.acme(
                  color: Colors.red,
                ),
              ),
              Text(
                'O',
                style: GoogleFonts.acme(
                  color: Colors.orange,
                ),
              ),
              Text(
                'G',
                style: GoogleFonts.acme(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              //hifjfk
              Icon(Icons.android),
              SizedBox(
                width: 5,
              ),
              Text(
                'Notes',
                style: GoogleFonts.acme(),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signout();
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: AppDrawer(),
        ),
        body: /*Container(
          child: ListView(
            children: [
              NoteCard(Colors.red, 'My First Note'),
              NoteCard(Colors.orange, 'My Second Text'),
              NoteCard(Colors.green, 'My First Note'),
              NoteCard(Colors.green, 'My Second Text'),
              NoteCard(Colors.orange, 'My First Note'),
              NoteCard(Colors.red, 'My Second Text'),
            ],
          ),
        ),*/
            NotesList(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          elevation: 0,
          child: Text(
            '+',
            style: TextStyle(fontSize: 25),
          ),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(
            color: Colors.red,
            size: 26,
          ),
          selectedItemColor: Colors.red,
          currentIndex: _bottomBarIndex,
          onTap: (index) {
            setState(() {
              _bottomBarIndex = index;
            });
            //print(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
