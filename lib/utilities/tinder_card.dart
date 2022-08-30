import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TinderCard extends StatelessWidget {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _users.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Container(
                    height: 400,
                    width: 400,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Text(
                          documentSnapshot['Name'],
                        ),
                      ],
                    ),
                  );
                }),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
