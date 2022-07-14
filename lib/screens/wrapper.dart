import 'package:flutter/material.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/screens/auth/signInAnon.dart';
import 'package:notes/screens/auth/signin.dart';
import 'package:notes/screens/home/homepage.dart';
import 'package:provider/provider.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_print

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);

    return user != null ? HomePage() : SignIn();
  }
}
