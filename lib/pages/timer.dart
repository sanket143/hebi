import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final int session;
  final String labelName;

  const TimerPage({Key key, this.session, this.labelName}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer _timer;
  int _session;
  bool _isActive;

  void toggleTimer() {
    if (_isActive) {
      _timer.cancel();
      setState(() {
        _isActive = false;
      });
    } else {
      const oneSec = const Duration(seconds: 1);
      setState(() {
        _isActive = true;
      });
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {
            if (_session < 1) {
              timer.cancel();
              _isActive = false;
            } else {
              _session = _session - 1;
              _isActive = true;
            }
          },
        ),
      );
    }
  }

  String toTimerString() {
    String minutes = (_session ~/ 60).toString().padLeft(2, '0');
    String seconds = (_session % 60).toString().padLeft(2, '0');

    return "$minutes:$seconds";
  }

  @override
  void initState() {
    _session = widget.session;
    _isActive = false;
    super.initState();
  }

  @override
  void dispose() {
    if (_timer?.isActive ?? false) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: !_isActive,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  child: Text(
                    widget.labelName,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13.0,
              ),
              GestureDetector(
                onTap: () {
                  toggleTimer();
                },
                child: Text(
                  toTimerString(),
                  style: TextStyle(
                    fontSize: 100,
                    color: _timer?.isActive ?? false
                        ? Colors.teal
                        : Color(0xFF515151),
                  ),
                ),
              ),
              Visibility(
                visible: !_isActive,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
