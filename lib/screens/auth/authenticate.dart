import 'package:flutter/material.dart';
import 'package:notes/screens/auth/register.dart';
import 'package:notes/screens/auth/signIn.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool toggle = true;

  void toggleForm() {
    setState(
      () {
        toggle = !toggle;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (toggle) {
      return SignIn(
        toggle: toggleForm,
      );
    } else {
      return Register(
        toggle: toggleForm,
      );
    }
  }
}
