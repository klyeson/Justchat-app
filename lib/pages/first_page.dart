import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justchat/colors.dart';
import 'package:justchat/net/authentication.dart';
import 'package:justchat/pages/first_profile_page.dart';
import 'package:justchat/pages/chat_page.dart';
import 'package:justchat/pages/search_page.dart';
import 'package:provider/provider.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _screens = [
    Chat(),
    Search(),
    FirstProfile(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        builder: (context, snapshot) {
          return MultiProvider(
            providers: [
              Provider<AuthenticationService>(
                create: (_) => AuthenticationService(FirebaseAuth.instance),
              ),
              StreamProvider(
                create: (context) =>
                    context.read<AuthenticationService>().authStateChanges,
                initialData: null,
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primaryColor: primaryColor),
              home: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.lightBlue[300],
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  title: Center(
                    child: Text('JustChat'),
                  ),
                  elevation: 0,
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          context.read<AuthenticationService>().signOut();
                        },
                        child: Icon(
                          Icons.logout,
                          size: 26.0,
                        ),
                      ),
                    ),
                  ],
                ),
                body: _screens[_selectedIndex],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.chat), label: 'Chat'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Profile'),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
