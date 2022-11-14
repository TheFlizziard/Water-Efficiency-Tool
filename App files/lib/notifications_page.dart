import 'package:flutter/material.dart';

import './notifications.dart';

class NotificationsManager extends StatelessWidget {
  final List<String> _notifications_list = ['You reached your monthly goal!'];

  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      home: Scaffold(
        body: Notifications(_notifications_list),
      ),
    );
  }
}
