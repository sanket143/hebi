import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final int session;
  
  const TimerPage({Key key, this.session }): super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer _timer;
  int _session;

  void toggleTimer() {
    if(_timer?.isActive ?? false){
      _timer.cancel();
    } else { 
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {
            if (_session < 1) {
              timer.cancel();
            } else {
              _session = _session - 1;
            }
          },
        ),
      );
    }
  }

  String toTimerString(int seconds){
    String minutes = (_session ~/ 60).toString().padLeft(2, '0');
    String seconds = (_session % 60).toString().padLeft(2, '0');

    return "$minutes:$seconds";
  }

  @override
  void initState() {
    _session = widget.session;
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
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
              GestureDetector(
                onTap: (){
                  toggleTimer();
                },
                child: Text(
                  toTimerString(_session),
                  style: TextStyle(
                    fontSize: 100,
                    color: Color(0xFF515151),
                  )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
