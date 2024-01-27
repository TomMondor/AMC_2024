import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import '../exceptions/exceptions.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLogged() => _auth.currentUser != null;

  User? get currentUser => _auth.currentUser;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      throw const AuthenticationException(
        message: 'Invalid email or password.',
      );
    } catch (e) {
      throw const AuthenticationException(
        message: 'Something went wrong. Please try again later.',
      );
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      throw const AuthenticationException(
        message: 'Invalid email or password.',
      );
    } catch (e) {
      throw const AuthenticationException(
        message: 'Something went wrong. Please try again later.',
      );
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw const AuthenticationException(
        message: 'Something went wrong. Please try again later.',
      );
    }
  }
}
