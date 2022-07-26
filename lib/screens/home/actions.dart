import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Act {
  late String note;
  late String priority;
  void showdisplay(BuildContext context, Function add) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Add',
            style: GoogleFonts.acme(letterSpacing: 1),
          ),
          content: Container(
            height: 200,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Note',
                  ),
                  cursorColor: Colors.red,
                  style: GoogleFonts.acme(
                    letterSpacing: 1,
                  ),
                  onChanged: (val) {
                    note = val;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Priority',
                  ),
                  cursorColor: Colors.red,
                  style: GoogleFonts.acme(
                    letterSpacing: 1,
                  ),
                  onChanged: (val) {
                    priority = val;
                  },
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                child: Text(
                  "Add",
                  style: GoogleFonts.acme(
                    letterSpacing: 1,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  await add(note, int.parse(priority));
                },
              ),
            )
          ],
        );
      },
    );
  }
}
