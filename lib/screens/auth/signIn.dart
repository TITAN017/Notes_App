import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/services/auth.dart';
import 'package:notes/utils/app_drawer.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_print
// ignore_for_file: unused_field

class SignIn extends StatefulWidget {
  final VoidCallback? toggle;

  const SignIn({this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //sigin widget with email and password
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
              icon: Icon(
                Icons.person,
              ),
              onPressed: widget.toggle,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
        height: 300,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(10),
        ),
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
                  _password = value;
                },
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () async {
                  await _auth.signin();
                },
                child: Text(
                  'Sign-In',
                ),
              ),
            ],
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
