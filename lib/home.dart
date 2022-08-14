import 'package:flutter/material.dart';

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
                onPressed: () {},
                child: Text('Sign Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
