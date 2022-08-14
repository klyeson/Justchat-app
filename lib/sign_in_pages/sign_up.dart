import 'package:flutter/material.dart';
import 'package:justchat/colors.dart';
import 'package:justchat/pages/first_page.dart';
import 'package:provider/provider.dart';
import '../net/authentication.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final aboutController = TextEditingController();
  final hobbiesController = TextEditingController();
  final interestsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey[300],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Email', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Password', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'First Name', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                      hintText: 'Age', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: aboutController,
                  decoration: InputDecoration(
                      hintText: 'About', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: hobbiesController,
                  decoration: InputDecoration(
                      hintText: 'Hobbies', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: interestsController,
                  decoration: InputDecoration(
                      hintText: 'Interests', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: MediaQuery.of(context).size.width),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                onPressed: () {
                  context.read<AuthenticationService>().signUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        name: nameController.text.trim(),
                        age: int.parse(ageController.text.trim()),
                        about: aboutController.text.trim(),
                        hobbies: hobbiesController.text.trim(),
                        interests: interestsController.text.trim(),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstPage(),
                    ),
                  );
                },
                child: Text('Sign Up'),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: MediaQuery.of(context).size.width),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Already have an account? Sign In"),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
