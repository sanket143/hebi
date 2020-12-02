import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:hebi/pages/models.dart';
import 'package:hebi/pages/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  final List<String> items = [
    "Version",
    "Source Code",
    "App Intro",
    "Tutorial",
    "Rate this app"
  ];

  final List icons = [
    Icon(FeatherIcons.info),
    Icon(FeatherIcons.github),
    Icon(FeatherIcons.tv),
    Icon(FeatherIcons.youtube),
    Icon(FeatherIcons.star)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).brightness == Brightness.light
            ? TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500
              ),
            )
            : Theme.of(context).textTheme,
        iconTheme: IconThemeData(
          color:Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Theme.of(context).iconTheme.color,
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).primaryColor
            : Theme.of(context).appBarTheme.color,
        title: Text(
          "About",
        ),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          children: [
            Option(
              text: "Version",
              onTap: null,
              leading: Icon(FeatherIcons.info),
            ),
            Option(
              text: "Source Code",
              onTap: () async {
                const github = "https://github.com/sanket143/hebi";
                if (await canLaunch(github)) {
                  await launch(github);
                }
              },
              leading: Icon(FeatherIcons.github),
            ),
            Option(
              text: "App Intro",
              onTap: null,
              leading: Icon(FeatherIcons.tv),
            ),
            Option(
              text: "Tutorial",
              onTap: null,
              leading: Icon(FeatherIcons.youtube),
            ),
            Option(
              text: "Rate this app",
              onTap: null,
              leading: Icon(FeatherIcons.star),
            ),
          ],
        ),
      ),
    );
  }
}
