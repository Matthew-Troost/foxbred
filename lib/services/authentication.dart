import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    try {
      FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.uid;
    } catch (exception) {
      return getErrorMessage(exception.code);
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user.uid;
    } catch (exception) {
      return getErrorMessage(exception.code);
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case "ERROR_USER_NOT_FOUND":
        return "User Not Found";
      case "ERROR_EMAIL_ALREADY_IN_USE":
        return "Email in use";
      case "ERROR_USER_DISABLED":
        return "User Disabled";
      case "ERROR_USER_TOKEN_EXPIRED":
        return "User Token Expired";
      case "ERROR_INVALID_USER_TOKEN":
        return "Invalid User Token";
      default:
        return "There was an error whilst logging you in";
    }
  }
}
