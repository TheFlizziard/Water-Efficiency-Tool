import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailField = TextEditingController();

  @override
  void dispose() {
    _emailField.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailField.text);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content:
                  Text('Password reset link sent! Please check your email!'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 0),
            child: Text(
              'Enter Your Email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
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
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: passwordReset,
            child: Text('Reset Password'),
            color: Colors.blue,
          )
        ]));
  }
}
