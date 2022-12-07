import 'package:firebase_core/firebase_core.dart';
import 'package:water_efficiency_tool/forgot_pw_page.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;

import './settings.dart';
import './home.dart';
import './home_page.dart';
import './notifications_page.dart';
import './sign_up_page.dart';
import 'net/flutterfire.dart';
import 'net/firebase_options.dart';
import 'forgot_pw_page.dart';
import './my_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());


const mongo_url="mongodb+srv://nikipuk:G0IG2U28BA9XPHxE@cluster0.htbrtpo.mongodb.net/test";
const collection_name="appliances";

void test() async {
  var api = await CallApi().getData('getall');
  print(jsonDecode(api));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static const String _title = 'Water Efficiency Tool';
  static const String name = '';
  static const String address = '';
  static const String volumeMetric = 'Liter';
  static bool remoteStatus = false;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: LoginManager(),
    );
  }
}

class LoginManager extends StatefulWidget {
  const LoginManager({Key? key}) : super(key: key);

  @override
  _LoginManagerState createState() => _LoginManagerState();
}

class _LoginManagerState extends State<LoginManager> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Login Page"),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
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
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                controller: _passwordField,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage()));
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    ); // Navigator
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            RichText(
              text: TextSpan(
                text: 'New User? ',
                children: <TextSpan>[
                  TextSpan(
                    text: 'Create Account',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpManager()));
                      },
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ]),
        ));
  }
}
