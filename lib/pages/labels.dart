import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sembast/sembast.dart';

import 'timer.dart';
import 'const.dart';

class Labels extends StatefulWidget {
  @override
  _LabelsState createState() => _LabelsState();
}

class _LabelsState extends State<Labels> {
  List _labels;

  int _currentEdit = -1;
  bool _loading = true;
  StoreRef store = StoreRef.main();

  void initState() {
    this._labels = [
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
    this.read();
    super.initState();
  }

  Future save({index, labelName, time}) async {
    Database db = await Hebi.getDatabase();

    if (index != null || index != -1) {
      setState(() {
        this._labels = List.from(_labels)..[index] = {
          "labelName": labelName,
          "time": time,
        };
      });
    }

    await store.record("labels").put(db, this._labels);

    setState(() {
      this._currentEdit = -1;
    });

    print("Saved");
  }

  Future delete(int index) async {
    setState(() {
      this._labels = List.from(_labels)..removeAt(index);
    });

    await this.save();
  }

  Future read() async {
    Database db = await Hebi.getDatabase();

    List labels = await store.record("labels").get(db) as List;

    setState(() {
      if (labels != null) {
        this._labels = labels;
      }

      this._loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._loading) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
          ),
        ),
      );
    }

    return Container(
      color: Colors.white,
      child: ListView(
        children: [
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
                        this._currentEdit = _currentEdit == index ? -1 : index;
                      });
                    },
                    onSave: ({
                      labelName,
                      time,
                    }) async {
                      await save(index: idx, labelName: labelName, time: time);
                    },
                    onDelete: () async {
                      await delete(idx);
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
                  onPressed: () {
                    setState(() {
                      this._labels = [
                        ..._labels,
                        {"labelName": "New Label", "time": 1520},
                      ];

                      this._currentEdit = this._labels.length - 1;
                    });
                  },
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
          ),
        ],
      ),
    );
  }
}

class Label extends StatelessWidget {
  final int index;
  final String labelName;
  final int time;
  final bool editMode;
  final void Function(int) onToggleEdit;
  final void Function({String labelName, int time}) onSave;
  final void Function() onDelete;

  Label(
    this.index, {
    this.labelName,
    this.time,
    this.editMode,
    this.onToggleEdit,
    this.onSave,
    this.onDelete,
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
                            labelName: this.labelName,
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
              onSave: ({
                labelName,
                time,
              }) {
                this.onSave(
                  labelName: labelName,
                  time: time,
                );
              },
              onDelete: () {
                this.onDelete();
              },
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
  final void Function({String labelName, int time}) onSave;
  final void Function() onDelete;

  LabelEdit(
    this.show, {
    this.label,
    this.time,
    this.onSave,
    this.onDelete,
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
              enabled: widget.show,
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
              enabled: widget.show,
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
                      widget.onDelete();
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
                      widget.onSave(
                        labelName: this._labelController.text,
                        time: int.parse(this._timeController.text) * 60,
                      );
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
