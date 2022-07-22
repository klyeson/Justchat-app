import 'package:flutter/material.dart';
import 'package:justchat/net/authentication.dart';
import 'package:provider/provider.dart';
import '../net/authentication.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('JustChat')),
        ),
        body: Container(
          color: Colors.blue[100],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 42, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Confirm Password'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      width: MediaQuery.of(context).size.width),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      context.read<AuthenticationService>().signUp(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                      await Navigator.of(context).pushNamedAndRemoveUntil(
                          '/', (Route<dynamic> route) => false);
                    },
                    child: Text('Sign Up'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ));
  }
}
