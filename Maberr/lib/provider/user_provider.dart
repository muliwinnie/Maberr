import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:Maberr/models/user.dart';
import 'package:Maberr/resources/firebase_repository.dart';

class UserProvider with ChangeNotifier {
  User _user;
  FirebaseRepository _firebaseRepository = FirebaseRepository();

  User get getUser => _user;

  void refreshUser() async {
    User user = await _firebaseRepository.getUserDetails();
    _user = user;
    notifyListeners();
  }

}