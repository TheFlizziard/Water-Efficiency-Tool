import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';

import 'home_page.dart';
import 'main.dart';

class HolidaySwitch extends StatefulWidget {
  const HolidaySwitch({super.key});

  @override
  _HolidaySwitchState createState() => _HolidaySwitchState();
}

class _HolidaySwitchState extends State<HolidaySwitch> {
  bool status = MyApp.remoteStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Explanation about the remote control", style: TextStyle(fontSize: 20)),
            CustomSwitch(
              activeColor: Colors.pinkAccent,
              value: status,
              onChanged: (value) {
                setState(() {
                  status = value;
                  MyApp.remoteStatus = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
