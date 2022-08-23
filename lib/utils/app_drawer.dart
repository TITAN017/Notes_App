import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/services/auth.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: use_key_in_widget_constructors

class AppDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              height: 50,
              child: Center(
                child: Text(
                  'Welcome User!',
                  style: GoogleFonts.acme(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
            ),
          ),
          SizedBox(
            height: 250,
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Logout',
                  style: GoogleFonts.acme(
                    fontSize: 22,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.logout),
              ],
            ),
            onTap: () async {
              await _auth.signout();
            },
          ),
        ],
      ),
    );
  }
}
