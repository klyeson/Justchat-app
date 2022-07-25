import 'package:flutter/material.dart';

import '../widgets/category_selector.dart';

class Chat extends StatelessWidget {
  const Chat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
