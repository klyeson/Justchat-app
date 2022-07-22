import 'package:flutter/material.dart';
import 'package:justchat/net/authentication.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('JustChat'),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text('Sign Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
