import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:hebi/pages/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import './conf.dart';

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
        textTheme: CustomAppBarTheme.getTextTheme(context),
        iconTheme: CustomAppBarTheme.getIconTheme(context),
        backgroundColor: CustomAppBarTheme.getBackgroundColor(context),
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
