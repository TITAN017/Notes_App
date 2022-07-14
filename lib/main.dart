import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/wrapper.dart';
import 'package:notes/services/auth.dart';
import 'package:provider/provider.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

void main() async {
  //initialize the bindings in flutter (low level process)
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize the firebase app
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(brightness: Brightness.dark),
        home: SafeArea(
          child: Wrapper(),
        ),
      ),
    );
  }
}
