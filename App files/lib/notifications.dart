import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final List<String> notificationsList;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  const Notifications(this.notificationsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: notificationsList
          .map(
            (element) => Card(
              child: Column(
                children: [
                  Text(element, style: optionStyle,)
                ],
              ),

            ),
          )
          .toList(),
    );
  }
}
