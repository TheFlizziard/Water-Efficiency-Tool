import 'package:flutter/material.dart';


import './settings.dart';
import './home.dart';
import './notifications_page.dart';
import './notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String _navigationTitle = 'Insights';
  int _selectedIndex = 0;
  static const TextStyle appBarStyle =
  TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    const Text(
      'Index 1: History / Projection',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Remote',
      style: optionStyle,
    ),
    Scaffold(
      body: NotificationsManager(),
      //style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _navigationTitle = 'Insights';
          }
          break;
        case 1:
          {
            _navigationTitle = 'Evolution';
          }
          break;
        case 2:
          {
            _navigationTitle = 'Remote';
          }
          break;
        case 3:
          {
            _navigationTitle = 'Notifications';
            NotificationsManager();
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: Text(
            _navigationTitle,
            style: appBarStyle,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 100.0,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons. settings, color: Colors.grey),
                tooltip: 'Settings button',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                          appBar: AppBar(
                            title: const Text('Settings'),
                          ),
                          body: const InfoField());
                    },
                  ));
                }),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Consumption',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_remote),
            label: 'Remote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}