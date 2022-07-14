import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/services/auth.dart';
import 'package:notes/utils/app_drawer.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_print

class Register extends StatefulWidget {
  final VoidCallback? toggle;

  const Register({this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _bottomBarIndex = 0;
  String _user = '';
  String _password = '';

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: IconButton(
              icon: Icon(Icons.person),
              onPressed: widget.toggle,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
        height: 350,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    hintText: 'Username',
                  ),
                  style: GoogleFonts.acme(
                    letterSpacing: 1,
                  ),
                  onChanged: (value) {
                    _user = value;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  style: GoogleFonts.acme(
                    letterSpacing: 1,
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    _user = value;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    print(_user);
                    print(_password);
                  },
                  child: Text(
                    'Register',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          color: Colors.red,
          size: 30,
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
    );
  }
}
