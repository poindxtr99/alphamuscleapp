import 'package:alphamuscle/src/models/exercise_category.dart';
import 'package:flutter/material.dart';
import '../uiwidgets/ui/exercise_list_view.dart';
import '../uiwidgets/ui/workout_builder_view.dart';
import '../models/exercise.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//this is where workouts get built
class WorkoutsScreen extends StatelessWidget {

  final GlobalKey<WorkoutBuilderViewState> workoutBuilderViewKey = GlobalKey();
  final GlobalKey<ExerciseListViewState> exerciseListViewKey = GlobalKey();

  addToWorkout(Exercise selectedExercise){
    // add the workout to the workout view
    print('addToWorkout called - workoutBuilderViewKey - ${workoutBuilderViewKey.currentState}');
    workoutBuilderViewKey.currentState?.viewAction(selectedExercise);
  } 

  removeFromWorkout(Exercise exerciseToRemove){
    // update the exercise list
    exerciseListViewKey.currentState?.viewAction(exerciseToRemove);
  }

  randomExercise(){
    // depends on the state of the exercise list

  }
  randomWorkout() {
    // This probably should have been an api call but whatevs

  }

  saveWorkout(){
    // take the workout state and grab send the workout list to the active workout list

  }
  
  cancelWorkout(){
    // close out the screen and disc

  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Workouts Screen')),
        body: Column(children: [
          WorkoutBuilderView(key: workoutBuilderViewKey, screenAction: removeFromWorkout),
          Container(
            child: Row(children: [
              Flexible(
                fit: FlexFit.loose,
                  child: Container(
                    height: 50,
                    color: Colors.green,
                    child: Center(child: ElevatedButton(onPressed: (){ addToWorkout(Exercise(name: 'Test', videoUrl: 'VideoUrl', hasVideoLink: true, difficulty: 'P', category: const ExerciseCategory("Legs", []))); },child: const Icon(Icons.add), ),),
                  ),
                ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  height: 50,
                  color: Colors.yellow,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  height: 50,
                  color: Colors.orange,
                ),
              ),
            ]),
          ),
          ExerciseListView(key: exerciseListViewKey, screenAction: addToWorkout)
        ]));
  }
}
