import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final data;

  SecondPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Text(data['Dishwasher']['measurementsTotal'].toString())),
    );
  }
}
