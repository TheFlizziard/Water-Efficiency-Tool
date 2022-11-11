import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.teal,
          child: Center(
            child: Text(
                'Index 0: Home',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
        )
    );
  }
}
