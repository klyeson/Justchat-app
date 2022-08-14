import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justchat/colors.dart';
import 'package:justchat/pages/profile_page.dart';

class FirstProfile extends StatefulWidget {
  const FirstProfile();

  @override
  _FirstProfileState createState() => _FirstProfileState();
}

class _FirstProfileState extends State<FirstProfile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: ListView(
            children: [
              Text(user.email!),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Center(
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: 32, color: primaryColor),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Text('Name'),
              TextFormField(
                decoration: InputDecoration(hintText: 'Age'),
              ),
              TextFormField(
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(hintText: 'About yourself'),
              ),
              TextFormField(
                minLines: 1,
                maxLines: 10,
                decoration:
                    InputDecoration(hintText: 'What hobbies do you have?'),
              ),
              TextFormField(
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(hintText: 'Interests'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: MediaQuery.of(context).size.width),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bio(),
                      ),
                    );
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white, letterSpacing: 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
