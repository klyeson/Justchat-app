import 'package:cloud_firestore/cloud_firestore.dart';
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
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            documentSnapshot['Name'],
                            style: TextStyle(fontSize: 32, color: primaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('Email:'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: ShapeDecoration(
                            color: Colors.grey[200],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              user.email!,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Age:'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: ShapeDecoration(
                            color: Colors.grey[200],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  documentSnapshot['Age'].toString(),
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('About:'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: ShapeDecoration(
                            color: Colors.grey[200],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              documentSnapshot['About'],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hobbies:'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: ShapeDecoration(
                            color: Colors.grey[200],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              documentSnapshot['Hobbies'],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Interests:'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: ShapeDecoration(
                            color: Colors.grey[200],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              documentSnapshot['Interests'],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
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
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
