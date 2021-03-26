import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:justchat/home.dart';
import 'package:justchat/sign_in_pages/sign_in.dart';
import 'package:justchat/sign_in_pages/sign_up.dart';
import 'package:justchat/sign_in_pages/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
