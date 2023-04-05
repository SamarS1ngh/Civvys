import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> registerWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    User? user;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;

      await FirebaseFirestore.instance
          .collection('UserData')
          .doc(user?.uid)
          .set({'UID': user?.uid, 'Email': user?.email, 'Name': name});
      // user?.updateDisplayName(name);
      return user;
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

  Future<User?> signInWithGoogle(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Auth.customSnackBar(
              content:
                  'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Auth.customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          Auth.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }

    return user;
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}

class DatabaseService {
  Future<Map<String, dynamic>> getUser(String? uid) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('UserData');
    final snapshot = await users.doc(uid).get();

    final data = snapshot.data() as Map<String, dynamic>;
    return data;
  }
}

class pswdReset {
  Future<String?> resetPassword(String email) async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
