import 'package:flutter/material.dart';
import '../../models/exercise.dart';

class ExerciseTile extends StatelessWidget {
  //final Exercise data;
  final String data;
  const ExerciseTile({super.key, required this.data});

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 8),
      child: Container(
        height: 25,
        decoration:
          BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10), boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 2,
            offset: Offset(1.0, 7.0),
          )
        ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Expanded(flex: 3, child: Text(data))
          ],
        ),
      ),
    );
  }
}
