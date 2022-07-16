import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/models/user_model.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_print

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//convert from firebase user to custom user

  MyUser? _convert(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

//stream for listening to changes in auth states

  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_convert);
  }

//Sign in Anonymous method

  Future signinAnon() async {
    try {
      UserCredential _result = await _auth.signInAnonymously();
      User? _userCred = _result.user;
      return _convert(_userCred);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password

  Future register(String email, String password) async {
    try {
      UserCredential _result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = _result.user;
      return _convert(user);
    } catch (e) {
      print("error register");
      return null;
    }
  }

  //sign in email/password

  Future signin(String user, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: user, password: pass);
      User? _userCred = result.user;
      return _convert(_userCred);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign-out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
