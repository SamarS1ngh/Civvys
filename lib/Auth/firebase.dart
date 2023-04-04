import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    User? user;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    User? user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }
    return user;
  }
}
