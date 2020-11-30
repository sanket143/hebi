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
      child: Container(
        color: Color(0xFFEEEEEE),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    labelName,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
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
              ),
            ),
            GestureDetector(
              child: Container(
                child: Icon(FeatherIcons.moreVertical),
                width: 50.0,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  child: SimpleDialog(
                    title: Text(labelName),
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Edit");
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(FeatherIcons.edit2),
                            ),
                            Expanded(
                              child: Text("Edit"),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Delete");
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(FeatherIcons.delete),
                            ),
                            Text("Delete"),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
