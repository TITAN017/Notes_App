import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Act {
  String note = '';
  String priority = '0';

  dynamic checkRange(String val) {
    if (val.isEmpty) {
      return "Priority field is Null";
    } else {
      if (int.parse(val) > 3 || int.parse(val) < 1) {
        return "Priority should lie in (1-3)";
      } else {
        return null;
      }
    }
  }

  void showdisplay(
      BuildContext context, Function action, String actionType, String? id) {
    final key = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            actionType == 'Add' ? 'Add Note' : 'Modify',
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
                    validator: (val) {
                      return checkRange(val!);
                    },
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
                  actionType == 'Add' ? 'Add' : 'Modify',
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
                    actionType == 'Add'
                        ? await action(
                            note,
                            int.parse(priority),
                          )
                        : await action(
                            id,
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
