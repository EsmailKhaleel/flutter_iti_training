import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email and password
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user == null) {
        return null;
      }
      User user = result.user!;
      debugPrint(user.email.toString());
      return user;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  // register with email and password
  Future register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user == null) {
        return null;
      }
      User user = result.user!;
      return user;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
