import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justchat/colors.dart';
import 'package:justchat/pages/first_page.dart';

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
                decoration: InputDecoration(hintText: 'First name'),
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
                decoration: InputDecoration(hintText: 'Hobbies'),
              ),
              TextField(
                controller: interestController,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(hintText: 'Interests'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      width: MediaQuery.of(context).size.width),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: buttonColor,
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      var firebaseUser = FirebaseAuth.instance.currentUser;
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(firebaseUser!.uid)
                          .update(
                        {
                          'Name': nameController.text.trim(),
                          'Age': ageController.text.trim(),
                          'About': aboutController.text.trim(),
                          'Hobbies': hobbyController.text.trim(),
                          'Interests': interestController.text.trim(),
                        },
                      );
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FirstPage()),
                        ),
                      );
                    },
                    child: Text('Continue'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
