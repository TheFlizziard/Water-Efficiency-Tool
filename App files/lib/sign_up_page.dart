import 'package:flutter/material.dart';

import './settings.dart';
import './home.dart';
import './home_page.dart';
import './main.dart';
import 'net/flutterfire.dart';

class SignUpManager extends StatefulWidget {
  const SignUpManager({Key? key}) : super(key: key);

  @override
  _SignUpManagerState createState() => _SignUpManagerState();
}

class _SignUpManagerState extends State<SignUpManager> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final TextEditingController _confirmPasswordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Sign Up Page")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 200,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('./asset/images/logo_wet.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailField,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _passwordField,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 30.0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _confirmPasswordField,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm password',
                    hintText: 'Enter the password again'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await register(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  }
                },
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
