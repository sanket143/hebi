import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'timer.dart';

class Labels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Label("Work", 1800),
          Label("Short Break", 1900),
          Label("Long Break", 2100),
        ],
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String labelName;
  final int time;

  Label(this.labelName, this.time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TimerPage(
                session: time,
              ),
            ),
          );
        },
        child: Container(
          color: Color(0xFFEEEEEE),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 5.0, 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    labelName,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Icon(FeatherIcons.moreVertical)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
