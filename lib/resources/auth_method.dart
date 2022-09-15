import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitch_clone/utils/constants.dart';

class AuthMethods {
  final _userRef =
      FirebaseFirestore.instance.collection(Constants.userCollection);
  final _auth = FirebaseAuth.instance;

  signUpUser() async {}
}
