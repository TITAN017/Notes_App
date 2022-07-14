import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/services/auth.dart';
import 'package:notes/utils/app_drawer.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_print

class SignInAnon extends StatefulWidget {
  const SignInAnon({Key? key}) : super(key: key);

  @override
  State<SignInAnon> createState() => _SignInState();
}

class _SignInState extends State<SignInAnon> {
  int _bottomBarIndex = 0;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
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
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black87,
            ),
            //ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black87),),
            child: Text(
              "Submit",
              style: GoogleFonts.acme(),
            ),
            onPressed: () async {
              dynamic result = await _auth.signinAnon();
              if (result == null) {
                print('null');
              } else {
                print('success');
                print(result.uid);
              }
            },
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
