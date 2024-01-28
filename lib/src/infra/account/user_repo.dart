import 'package:amc_2024/src/exceptions/exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/user/user.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String uid, String name, String surname, String carId) async {
    final User user = User(
      name: name,
      surname: surname,
      carId: carId,
    );

    try {
      await _firestore.collection('users').doc(uid).set(user.toMap());
    } on Exception catch (e) {
      print(e);
      throw const FirestoreException(
        message: 'Something went wrong. Please try again later.',
      );
    }
  }

  Future<User> getUser(String uid) async {
    try {
      final DocumentSnapshot documentSnapshot = await _firestore.collection('users').doc(uid).get();
      final Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      return User(
        name: data['name'],
        surname: data['surname'],
        carId: data['carId'],
      );
    } on Exception catch (e) {
      print(e);
      throw const FirestoreException(
        message: 'Something went wrong. Please try again later.',
      );
    }
  }
}
