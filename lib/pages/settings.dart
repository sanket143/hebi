import 'package:flutter/material.dart';
import 'package:hebi/pages/models.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hebi/pages/settings/about.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView(
        children: [
          Option(
            text: "General",
            onTap: () {
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
            onTap: () {
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
            onTap: () {
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
            onTap: () {
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
