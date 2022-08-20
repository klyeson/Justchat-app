import 'package:flutter/material.dart';
import 'package:justchat/utilities/tinder_card.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.65,
              color: Colors.grey,
              child: Stack(
                children: [
                  TinderCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
