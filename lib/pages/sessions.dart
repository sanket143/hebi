import 'package:flutter/material.dart';
import 'package:hebi/pages/timer.dart';

class Sessions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ElevatedButton(
          child: Text("Timer"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimerPage()),
            );
          },
        ),
      ),
    );
  }
}
