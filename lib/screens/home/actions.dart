import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Act {
  String note = '';
  String priority = '0';

  bool checkRange(String val) {
    print("Entering func");
    try {
      if (int.parse(val) > 3 || int.parse(val) < 1) {
        print("Entering func true");
        return true;
      }
      print("Entering func false 1");
      return false;
    } catch (e) {
      print("Entering func false 2");
      print(e.toString());
      return false;
    }
  }

  void showdisplay(BuildContext context, Function add) {
    final key = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            'Add Note',
            style: GoogleFonts.acme(letterSpacing: 1),
          ),
          content: Container(
            height: 200,
            padding: const EdgeInsets.all(5),
            child: Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'Note cannot be empty' : null,
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
                    validator: (val) => checkRange(val ?? '0')
                        ? 'Priority should lie between (1-3)'
                        : null,
                    decoration: const InputDecoration(
                      hintText: 'Priority',
                    ),
                    cursorColor: Colors.red,
                    style: GoogleFonts.acme(
                      letterSpacing: 1,
                    ),
                    onChanged: (val) {
                      print(val);
                      priority = val;
                    },
                  ),
                ],
              ),
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
                  if (key.currentState!.validate()) {
                    Navigator.pop(context);
                    await add(
                      note,
                      int.parse(priority),
                    );
                  }
                },
              ),
            )
          ],
        );
      },
    );
  }
}
