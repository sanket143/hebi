import 'package:flutter/material.dart';

import './productivity_stats.dart';
import './sessions.dart';
import './settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<String> _childrenTitle = [
    "Sessions",
    "Productivity Stats",
    "Settings",
  ];

  final List<Widget> _children = [
    Sessions(),
    ProductivityStats(),
    Settings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _childrenTitle[_currentIndex],
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.label),
            label: 'Sessions',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.insights),
            label: 'Productivity Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }
}
