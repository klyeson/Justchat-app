import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justchat/colors.dart';
import 'package:justchat/pages/first_profile_page.dart';
import 'package:justchat/pages/chat_page.dart';
import 'package:justchat/pages/search_page.dart';

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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: primaryColor),
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: buttonColor,
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white70,
                    size: 24,
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
                      onTap: () => FirebaseAuth.instance.signOut(),
                      child: Icon(
                        Icons.logout,
                        size: 24.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
              body: _screens[_selectedIndex],
              bottomNavigationBar: SizedBox(
                height: 50,
                child: BottomNavigationBar(
                  iconSize: 20,
                  backgroundColor: buttonColor,
                  unselectedItemColor: Colors.white54,
                  selectedItemColor: Colors.white,
                  currentIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.message_rounded), label: 'Chat'),
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
