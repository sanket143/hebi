import 'package:flutter/material.dart';
import 'package:hebi/pages/settings/about.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Option(
            text: "General",
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
          Option(
            text: "About",
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
          Option(
            text: "Give Feedback",
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
          Option(
            text: "Report a Bug",
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
          Option(
            text: "Reset App",
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
        ],
      )
    );
  }
}

class Option extends StatelessWidget {
  final String text;
  final void Function() onTap;

  Option({
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      child: Container(
        color: Color(0xFFFAFAFA),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    this.text,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onTap: () {
                  this.onTap();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
