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
  PageController _pageController = PageController();
  List<Widget> _screens = [
    Chat(),
    Search(),
    FirstProfile(),
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        builder: (context, snapshot) {
          final firebaseUser = context.watch<User>();
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
                  title: Center(
                    child: Text('JustChat'),
                  ),
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
                body: PageView(
                  controller: _pageController,
                  children: _screens,
                  onPageChanged: _onPageChanged,
                  physics: NeverScrollableScrollPhysics(),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  onTap: _onItemTapped,
                  iconSize: 20,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.chat_bubble,
                          color:
                              _selectedIndex == 0 ? primaryColor : Colors.grey,
                        ),
                        label: 'Chat'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search,
                          color:
                              _selectedIndex == 1 ? primaryColor : Colors.grey,
                        ),
                        label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person,
                          color:
                              _selectedIndex == 2 ? primaryColor : Colors.grey,
                        ),
                        label: 'Profile'),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
