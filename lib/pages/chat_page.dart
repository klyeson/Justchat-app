import 'package:flutter/material.dart';
import 'package:justchat/colors.dart';
import 'message_template.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          TextButton(
            child: Text('Chat messages'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Messages(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
