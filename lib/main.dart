import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:justchat/net/authentication.dart';
import 'package:justchat/pages/first_page.dart';
import 'package:justchat/sign_in_pages/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
          home: AuthenticationWrapper(), debugShowCheckedModeBanner: false),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return FirstPage();
    }
    return SignIn();
  }
}

//width: MediaQuery.of(context).size.width,
//height: MediaQuery.of(context).size.height,
