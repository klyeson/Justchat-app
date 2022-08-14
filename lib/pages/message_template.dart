import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:justchat/colors.dart';
import 'package:justchat/net/messages_class.dart';

class Messages extends StatefulWidget {
  const Messages();

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<Message> messages = [
    Message(
        text: 'yes, sure 1',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'yes, sure 2',
        date: DateTime.now().subtract(Duration(days: 2, minutes: 3)),
        isSentByMe: true),
    Message(
        text: 'yes, sure 3',
        date: DateTime.now().subtract(Duration(days: 3, minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'yes, sure 4',
        date: DateTime.now().subtract(Duration(days: 4, minutes: 1)),
        isSentByMe: true),
    Message(
        text: 'yes, sure 5',
        date: DateTime.now().subtract(Duration(days: 5, minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'yes, sure 6',
        date: DateTime.now().subtract(Duration(days: 6, minutes: 1)),
        isSentByMe: true),
    Message(
        text: 'yes, sure 7',
        date: DateTime.now().subtract(Duration(days: 7, minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'yes, sure 8',
        date: DateTime.now().subtract(Duration(days: 7, minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'yes, sure 9',
        date: DateTime.now().subtract(Duration(days: 7, minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'yes, sure 10',
        date: DateTime.now().subtract(Duration(days: 8, minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'yes, sure 11',
        date: DateTime.now().subtract(Duration(days: 8, minutes: 1)),
        isSentByMe: false),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: const EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: buttonColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: TextField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Type your message here...'),
              onSubmitted: (text) {
                final message =
                    Message(text: text, date: DateTime.now(), isSentByMe: true);
                setState(() => messages.add(message));
              },
            ),
          ),
        ],
      ),
    );
  }
}
