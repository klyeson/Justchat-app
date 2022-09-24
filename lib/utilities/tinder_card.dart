import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justchat/net/user.dart';

class TinderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = FirebaseAuth.instance.currentUser;
    Future<UserData?> readUsers() async {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(users!.uid);
      final snapshot = await docUser.get();

      if (snapshot.exists) {
        return UserData.fromJson(snapshot.data()!);
      }
    }

    return Scaffold(
        body: FutureBuilder<UserData?>(
      future: readUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final otherUserData = snapshot.data;
          return otherUserData == null
              ? Center(child: Text('No User'))
              : ListView(
                  children: [
                    Row(
                      children: [Text(otherUserData.name)],
                    )
                  ],
                );
        }
        return CircularProgressIndicator();
      },
    ));
  }
}
