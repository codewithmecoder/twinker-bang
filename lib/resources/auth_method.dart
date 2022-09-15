import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitch_clone/models/user_model.dart';
import 'package:twitch_clone/utils/constants.dart';
import 'package:twitch_clone/utils/utils.dart';

class AuthMethods {
  final _userRef =
      FirebaseFirestore.instance.collection(Constants.userCollection);
  final _auth = FirebaseAuth.instance;

  Future<UserModel?> signUpUser(
    BuildContext context,
    String email,
    String username,
    String password,
  ) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (cred.user != null) {
        UserModel user = UserModel(
          uid: cred.user!.uid,
          username: username.trim(),
          email: email.trim(),
        );

        await _userRef.doc(user.uid).set(user.toMap());
        return user;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
    return null;
  }
}
