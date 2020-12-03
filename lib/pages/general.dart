import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'conf.dart';

class GeneralPage extends StatefulWidget {

  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  bool notificationSound;
  bool vibration;

  @override
  void initState() {
    notificationSound = false;
    vibration = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: CustomAppBarTheme.getTextTheme(context),
        iconTheme: CustomAppBarTheme.getIconTheme(context),
        backgroundColor: CustomAppBarTheme.getBackgroundColor(context),
        title: Text(
          "General",
        ),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Dark Mode",
                      style: TextStyle(
                        fontSize: 18.0,
                      )
                    ),
                  ),
                  StreamBuilder<bool>(
                    initialData: Hebi.prefs.getBool("darkMode") ?? false,
                    stream: Hebi.darkMode.stream,
                    builder: (context, snapshot) {
                      return Switch(
                        value: snapshot.data,
                        onChanged: (val){
                          Hebi.setDarkMode(val);
                        },
                      );
                    }
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Notification Sound",
                      style: TextStyle(
                        fontSize: 18.0,
                      )
                    ),
                  ),
                  Switch(
                    value: notificationSound,
                    onChanged: (val){
                      Hebi.setDarkMode(val);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Vibration",
                      style: TextStyle(
                        fontSize: 18.0,
                      )
                    ),
                  ),
                  Switch(
                    value: notificationSound,
                    onChanged: (val){
                      Hebi.setDarkMode(val);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
