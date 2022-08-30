import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justchat/colors.dart';
import 'package:justchat/net/authentication.dart';
import 'package:provider/provider.dart';
import 'package:justchat/net/user.dart';

class FirstProfile extends StatefulWidget {
  @override
  _FirstProfileState createState() => _FirstProfileState();
}

class _FirstProfileState extends State<FirstProfile> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _aboutController = TextEditingController();
  final _hobbiesController = TextEditingController();
  final _interestsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _aboutController.dispose();
    _hobbiesController.dispose();
    _interestsController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Future<UserData?> readUser() async {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(user.uid);
      final snapshot = await docUser.get();

      if (snapshot.exists) {
        return UserData.fromJson(snapshot.data()!);
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder<UserData?>(
            future: readUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data;
                return userData == null
                    ? Center(child: Text('No User'))
                    : SingleChildScrollView(
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
                                  style: TextStyle(
                                      fontSize: 32, color: primaryColor),
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
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(userData.name),
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextField(
                                                        controller:
                                                            _nameController,
                                                        decoration:
                                                            const InputDecoration(
                                                                labelText:
                                                                    'Name'),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      ElevatedButton(
                                                        child: const Text(
                                                            'Update'),
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  AuthenticationService>()
                                                              .updateName(
                                                                  name: _nameController
                                                                      .text
                                                                      .trim()
                                                                      .capitalize());

                                                          Navigator.of(ctx)
                                                              .pop();
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
                                      ]),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(userData.age.toString()),
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextField(
                                                      keyboardType:
                                                          const TextInputType
                                                                  .numberWithOptions(
                                                              decimal: false),
                                                      controller:
                                                          _ageController,
                                                      decoration:
                                                          const InputDecoration(
                                                              labelText: 'Age'),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    ElevatedButton(
                                                      child:
                                                          const Text('Update'),
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                AuthenticationService>()
                                                            .updateAge(
                                                              age: int.parse(
                                                                  _ageController
                                                                      .text
                                                                      .trim()),
                                                            );
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(userData.about),
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextField(
                                                      controller:
                                                          _aboutController,
                                                      decoration:
                                                          const InputDecoration(
                                                              labelText:
                                                                  'About'),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    ElevatedButton(
                                                      child:
                                                          const Text('Update'),
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                AuthenticationService>()
                                                            .updateAbout(
                                                                about: _aboutController
                                                                    .text
                                                                    .trim()
                                                                    .capitalize());

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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(userData.hobbies),
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextField(
                                                      controller:
                                                          _hobbiesController,
                                                      decoration:
                                                          const InputDecoration(
                                                              labelText:
                                                                  'Hobbies'),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    ElevatedButton(
                                                      child:
                                                          const Text('Update'),
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                AuthenticationService>()
                                                            .updateHobbies(
                                                                hobbies:
                                                                    _hobbiesController
                                                                        .text
                                                                        .trim()
                                                                        .capitalize());

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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(userData.interests),
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextField(
                                                      controller:
                                                          _interestsController,
                                                      decoration:
                                                          const InputDecoration(
                                                              labelText:
                                                                  'Interests'),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    ElevatedButton(
                                                      child:
                                                          const Text('Update'),
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                AuthenticationService>()
                                                            .updateInterests(
                                                                interests:
                                                                    _interestsController
                                                                        .text
                                                                        .trim()
                                                                        .capitalize());

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
              } else
                return Center(child: CircularProgressIndicator());
            }));
  }
}

extension MyExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
