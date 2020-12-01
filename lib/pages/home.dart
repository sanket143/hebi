import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

import './productivity_stats.dart';
import './labels.dart';
import './settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;
  int _index;

  final List<String> _childrenTitle = [
    "Productivity Stats",
    "Labels",
    "Settings",
  ];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this, initialIndex: 1);
    _index = 1;

    _controller.addListener(() {
      setState(() {
        _index = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _childrenTitle[_index],
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ProductivityStats(),
            Labels(),
            Settings(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int _index) {
            setState(() {
              this._index = _index;
              this._controller.index = _index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.activity),
              label: "Productivity Status",
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.tag),
              label: "Labels",
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
