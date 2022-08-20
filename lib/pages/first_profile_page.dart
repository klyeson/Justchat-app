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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();
  final TextEditingController _interestsController = TextEditingController();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: _users.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return SingleChildScrollView(
                  child: Card(
                    elevation: 0,
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
                            'Profile',
                            style: TextStyle(fontSize: 32, color: primaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('Name:'),
                        ),
                        //Name Container
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
                              documentSnapshot['Name'],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('Email:'),
                        ),
                        //Email Container
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
                        //Age Container
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  documentSnapshot['Age'].toString(),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: ((BuildContext ctx) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              left: 20,
                                              right: 20,
                                              bottom: MediaQuery.of(ctx)
                                                      .viewInsets
                                                      .bottom +
                                                  20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                keyboardType:
                                                    const TextInputType
                                                            .numberWithOptions(
                                                        decimal: false),
                                                controller: _ageController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Age'),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                child: const Text('Update'),
                                                onPressed: () async {
                                                  final double? age =
                                                      double.tryParse(
                                                          _ageController.text);
                                                  if (age != null) {
                                                    await _users
                                                        .doc(
                                                            documentSnapshot.id)
                                                        .update({'Age': age});
                                                    _ageController.text = '';
                                                    Navigator.of(ctx).pop();
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('About:'),
                        ),
                        //About Container
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  documentSnapshot['About'],
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: ((BuildContext ctx) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              left: 20,
                                              right: 20,
                                              bottom: MediaQuery.of(ctx)
                                                      .viewInsets
                                                      .bottom +
                                                  20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                controller: _aboutController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'About'),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                child: const Text('Update'),
                                                onPressed: () async {
                                                  final about =
                                                      _aboutController.text;
                                                  await _users
                                                      .doc(documentSnapshot.id)
                                                      .update({'About': about});
                                                  _ageController.text = '';
                                                  Navigator.of(ctx).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hobbies:'),
                        ),
                        //Hobbies Container
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  documentSnapshot['Hobbies'],
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: ((BuildContext ctx) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              left: 20,
                                              right: 20,
                                              bottom: MediaQuery.of(ctx)
                                                      .viewInsets
                                                      .bottom +
                                                  20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                controller: _hobbiesController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Hobbies'),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                child: const Text('Update'),
                                                onPressed: () async {
                                                  final hobbies =
                                                      _hobbiesController.text;
                                                  await _users
                                                      .doc(documentSnapshot.id)
                                                      .update(
                                                          {'Hobbies': hobbies});
                                                  _ageController.text = '';
                                                  Navigator.of(ctx).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Interests:'),
                        ),
                        //Interests Container
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  documentSnapshot['Interests'],
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: ((BuildContext ctx) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              left: 20,
                                              right: 20,
                                              bottom: MediaQuery.of(ctx)
                                                      .viewInsets
                                                      .bottom +
                                                  20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                controller:
                                                    _interestsController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Interests'),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                child: const Text('Update'),
                                                onPressed: () async {
                                                  final interests =
                                                      _interestsController.text;
                                                  await _users
                                                      .doc(documentSnapshot.id)
                                                      .update({
                                                    'Interests': interests
                                                  });
                                                  _ageController.text = '';
                                                  Navigator.of(ctx).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
