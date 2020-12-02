import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final Icon leading;

  Option({
    this.text,
    this.onTap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          color: Color(0xFFFAFAFA),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                this.leading != null
                    ? Container(
                        child: Row(
                          children: [
                            this.leading,
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Text(
                  this.text,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
