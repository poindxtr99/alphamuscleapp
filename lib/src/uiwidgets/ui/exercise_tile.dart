import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 8),
      child: Container(
        height: 60,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 30,
            offset: Offset(1.0, 9.0),
          )
        ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Expanded(flex: 3, child: Text("Test"))
          ],
        ),
      ),
    );
  }
}
