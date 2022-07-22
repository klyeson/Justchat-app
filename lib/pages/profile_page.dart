import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justchat/colors.dart';
import 'package:justchat/net/authentication.dart';
import 'package:justchat/pages/first_page.dart';
import 'package:provider/provider.dart';

class Bio extends StatefulWidget {
  @override
  _BioState createState() => _BioState();
}

class _BioState extends State<Bio> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController hobbyController = TextEditingController();
  final TextEditingController interestController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Center(
                child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 32, color: primaryColor),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(hintText: 'Age'),
              ),
              TextField(
                controller: aboutController,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(hintText: 'About yourself'),
              ),
              TextField(
                controller: hobbyController,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(hintText: 'Hobbies123'),
              ),
              TextField(
                controller: interestController,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(hintText: 'Interests'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ElevatedButton(
                  onPressed: () async {
                    var firebaseUser = FirebaseAuth.instance.currentUser;
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(firebaseUser.uid)
                        .update(
                      {
                        'name': nameController.text,
                        'age': ageController.text,
                        'about': aboutController.text,
                        'hobbies': hobbyController.text,
                        'interest': interestController.text
                      },
                    );
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirstPage()));
                  },
                  child: Text('Continue'),
                  style: buttonStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                  },
                  child: Text('Sign Out'),
                  style: buttonStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
