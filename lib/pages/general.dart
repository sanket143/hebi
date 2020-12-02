import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './conf.dart';

class GeneralPage extends StatefulWidget {

  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  bool darkTheme;

  @override
  void initState() {
    darkTheme = false;
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
            Container(
              padding: EdgeInsets.all(20.0),
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
                  Switch(
                    value: darkTheme,
                    onChanged: (val){
                      setState(() {
                        this.darkTheme = val;
                        
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
