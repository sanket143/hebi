import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      "time": 300,
    },
    {
      "labelName": "Long Break",
      "time": 600,
    },
  ];
  int _currentEdit = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(children: [
        ..._labels
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
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      FeatherIcons.plus,
                      size: 18.0,
                    ),
                    Text("Add Label")
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class Label extends StatelessWidget {
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
        color: this.editMode ? Color(0xFFF3F3F3) : Color(0xFFFAFAFA),
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
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
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
                    child: this.editMode
                        ? Icon(FeatherIcons.chevronUp)
                        : Icon(FeatherIcons.moreVertical),
                    width: 50.0,
                  ),
                  onTap: () {
                    this.onToggleEdit(this.index);
                  },
                ),
              ],
            ),
            LabelEdit(
              this.editMode,
              label: this.labelName,
              time: this.time,
            ),
          ],
        ),
      ),
    );
  }
}

class LabelEdit extends StatefulWidget {
  final bool show;
  final String label;
  final int time;

  LabelEdit(
    this.show, {
    this.label,
    this.time,
  });

  @override
  _LabelEditState createState() => _LabelEditState();
}

class _LabelEditState extends State<LabelEdit> {
  final double _bodyHeight = 170;
  TextEditingController _labelController;
  TextEditingController _timeController;

  @override
  void initState() {
    _labelController = new TextEditingController(text: widget.label);
    _timeController =
        new TextEditingController(text: (widget.time ~/ 60).toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
      height: widget.show ? _bodyHeight : 0.0,
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
        child: ListView(
          children: [
            TextField(
              controller: _labelController,
              cursorColor: Colors.teal,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(FeatherIcons.tag, size: 20.0),
                border: InputBorder.none,
                filled: true,
                hintText: "Label Name",
              ),
            ),
            TextField(
              controller: _timeController,
              cursorColor: Colors.teal,
              textAlignVertical: TextAlignVertical.center,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(FeatherIcons.clock, size: 20.0),
                border: InputBorder.none,
                hintText: "Minutes",
              ),
            ),
            Row(
              children: [
                Container(
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: () {
                      print("Delete");
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FeatherIcons.trash,
                          size: 20.0,
                          color: Color(0xFFDC143C),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(
                            color: Color(0xFFDC143C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: () {
                      print("Delete");
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FeatherIcons.check,
                          size: 20.0,
                          color: Colors.teal,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
