import 'package:alphamuscle/src/models/exercise.dart';
import 'package:flutter/material.dart';
import 'workout_builder_tile.dart';
import '../../models/increasing_size_physics.dart';

class WorkoutBuilderView extends StatefulWidget {

  final Function(Exercise) screenAction;
  const WorkoutBuilderView({super.key, required this.screenAction});
  
  @override
  State<WorkoutBuilderView> createState() => WorkoutBuilderViewState();
}

class WorkoutBuilderViewState extends State<WorkoutBuilderView> {
  List<Exercise> itemList = [];

  void viewAction(Exercise newExercise) {
    print('This is the viewAction:');
    setState(() {
      itemList.add(newExercise);
    });
  }
  void tileAction(Exercise exerciseToRemove) {
    setState(() {
      itemList.remove(exerciseToRemove);
    });
    widget.screenAction(exerciseToRemove);
  }

  double _calculateItemSize(int index, double scrollOffset, double center) {
    // Calculate the size based on the distance from the center
    double distanceFromCenter = (index * 100.0 - center).abs();
    double size = 100.0 - distanceFromCenter / 10.0; // Adjust the factor as needed
    return size.clamp(50.0, 100.0); // Clamp the size to a certain range
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.blue, // Set the background color as needed
          height: MediaQuery.of(context).size.height * 0.3,
          child: Center(
            child: ListView.separated(
              physics: const IncreasingSizePhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: itemList.length,
            itemBuilder: (ctx, index) {
              double center = MediaQuery.of(context).size.width / 2;
              double scrollOffset = MediaQuery.of(context).size.width;
              double itemSize = _calculateItemSize(index, scrollOffset, center);
              return WorkoutBuilderTile(height:itemSize, callBack: tileAction, data: itemList[index],);
            },
            separatorBuilder: (ctx, index) { return const SizedBox(width: 10,); },),
          ),
        
      );
  }
}
