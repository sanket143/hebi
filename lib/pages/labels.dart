import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'timer.dart';

class Labels extends StatefulWidget {
  @override
  _LabelsState createState() => _LabelsState();
}

class _LabelsState extends State<Labels> {
  final List _labels = [
    {
      "labelName": "Work",
      "time": 1800,
    },
    {
      "labelName": "Short Break",
      "time": 1900,
    },
    {
      "labelName": "Long Break",
      "time": 2100,
    },
  ];
  int _currentEdit = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: _labels
            .asMap()
            .map(
              (idx, item) => MapEntry(
                idx,
                Label(
                  idx,
                  labelName: item["labelName"],
                  time: item["time"],
                  editMode: _currentEdit == idx,
                  onToggleEdit: (index) {
                    setState(() {
                      this._currentEdit = _currentEdit == idx ? -1 : idx;
                    });
                  },
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}

class Label extends StatelessWidget{
  final int index;
  final String labelName;
  final int time;
  final bool editMode;
  final void Function(int) onToggleEdit;

  Label(
    this.index, {
    this.labelName,
    this.time,
    this.editMode,
    this.onToggleEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      child: Container(
        color: Color(0xFFFAFAFA),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        this.labelName,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TimerPage(
                            session: this.time,
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
                    this.onToggleEdit(this.index);
                  },
                ),
              ],
            ),
            LabelEdit(this.editMode)
          ],
        ),
      ),
    );
  }
}

class LabelEdit extends StatelessWidget {
  final bool show;
  final double _bodyHeight = 100;

  LabelEdit(this.show);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedContainer(
        child: Text("Description"),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        height: show ? _bodyHeight : 0.0,
      ),
    );
  }
}
