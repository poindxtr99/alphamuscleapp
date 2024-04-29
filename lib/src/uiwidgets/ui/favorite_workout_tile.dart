import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alphamuscle/src/providers/edit_workout_provider.dart';
import 'package:alphamuscle/src/models/workout.dart';

enum TileState {isOpen, isClosed}

class FavoriteWorkoutTile extends ConsumerStatefulWidget {
  //final workout data;
  final Workout data;  
  
  const FavoriteWorkoutTile({super.key, required this.data});
  @override
  ConsumerState<FavoriteWorkoutTile> createState() => FavoriteWorkoutTileState();
}

class FavoriteWorkoutTileState extends ConsumerState<FavoriteWorkoutTile> {
  TileState tileState = TileState.isClosed;
  void handleOnPressed(){
   setState(() {
       tileState = TileState.isOpen;
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
            Expanded(flex: 3, child: Text(widget.data.name)),
            ElevatedButton(onPressed: () {
              ref.read(editWorkoutProvider.notifier).setWorkoutForEdit(widget.data);
            }, child: const Icon(Icons.edit)),
            const ElevatedButton(onPressed: null, child: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
