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
  String user = '';
  String password = '';
  String error = '';

  final _key = GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
              height: 350,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _key,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'Email cannot be empty' : null,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: 'Username',
                        ),
                        style: GoogleFonts.acme(
                          letterSpacing: 1,
                        ),
                        onChanged: (value) {
                          user = value;
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        validator: (val) => val!.length < 6
                            ? 'Password must be 6 or more char long'
                            : null,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                        style: GoogleFonts.acme(
                          letterSpacing: 1,
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            print(user + password);
                            dynamic result =
                                await _auth.register(user, password);
                            if (result == null) {
                              setState(() {
                                error = 'Error Occured';
                              });
                            } else {
                              setState(() {
                                error = '';
                              });
                            }
                          }
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
            SizedBox(
              height: 20,
            ),
            Text(
              error,
              style: GoogleFonts.acme(color: Colors.red),
            ),
          ],
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
