import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

class AboutPage extends StatelessWidget {
  List<String> items = [
    "Version",
    "Source Code",
    "App Intro",
    "Tutorial",
    "Rate this app"
  ];

  List icons = [
    Icon(FeatherIcons.info),
    Icon(FeatherIcons.github),
    Icon(FeatherIcons.tv),
    Icon(FeatherIcons.youtube),
    Icon(FeatherIcons.star)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final icon = icons[index];
              return (
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 21.0,
                          height: 21.0,
                          child: icon,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          item,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ]
                    ),
                )
              );
            })
      )
    );
  }
}
