import 'package:flutter/cupertino.dart';
import 'package:twitch_clone/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    uid: '',
    username: '',
    email: '',
  );

  UserModel get user => _user;

  setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
