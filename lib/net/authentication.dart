import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {}
    return null;
  }

  Future signUp(
      {required String email,
      required String password,
      required String name,
      required int age,
      required String about,
      required String hobbies,
      required String interests}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    addUserDetails(name, age, about, hobbies, interests);
  }

  Future addUserDetails(String name, int age, String about, String hobbies,
      String interests) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('users').doc(firebaseUser!.uid).set({
      'Name': name,
      'Age': age,
      'About': about,
      'Hobbies': hobbies,
      'Interests': interests,
    });
  }

  Future updateName({required String name}) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .update({
      'Name': name,
    });
  }

  Future updateAge({required int age}) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .update({
      'Age': age,
    });
  }

  Future updateAbout({required String about}) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .update({
      'About': about,
    });
  }

  Future updateHobbies({required String hobbies}) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .update({
      'Hobbies': hobbies,
    });
  }

  Future updateInterests({required String interests}) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .update({
      'Interests': interests,
    });
  }
}
