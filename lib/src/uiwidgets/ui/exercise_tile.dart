import 'package:flutter/material.dart';
import 'package:alphamuscle/src/models/exercise_category.dart';
import '../../models/exercise.dart';

enum TileState {isAdded, isAvailable}

class ExerciseTile extends StatefulWidget {
  //final Exercise data;
  final String data;
  final Function tileAction;
  
  
  ExerciseTile({super.key, required this.data, required this.tileAction});

  @override
  State<ExerciseTile> createState() => ExerciseTileState();

  
}

class ExerciseTileState extends State<ExerciseTile> {
  TileState tileState = TileState.isAvailable;
  void handleOnPressed(){
    // This is BAD!!!! don't create a new Exercise everytime
    widget.tileAction(Exercise(name: widget.data, videoUrl: 'VideoUrl', hasVideoLink: true, difficulty: 'P', category: const ExerciseCategory("Legs", [])), this);
    setState(() {
       tileState = TileState.isAdded;
    });
  }

  void viewAction(){
    setState(() {
      tileState = TileState.isAvailable;
    });
  }
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
              child: IconButton(onPressed: tileState == TileState.isAvailable ? handleOnPressed : null, icon: const Icon(Icons.add), ),
            ),
            Expanded(flex: 3, child: Text(widget.data))
          ],
        ),
      ),
    );
  }
}
