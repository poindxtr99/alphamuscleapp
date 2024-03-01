import 'package:alphamuscle/src/models/exercise_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alphamuscle/src/providers/active_workout_provider.dart';
import 'package:alphamuscle/src/models/workout.dart';
import '../uiwidgets/ui/exercise_list_view.dart';
import '../uiwidgets/ui/workout_builder_view.dart';
import '../models/exercise.dart';

//this is where workouts get built
class WorkoutsScreen extends ConsumerWidget {

  final GlobalKey<WorkoutBuilderViewState> workoutBuilderViewKey = GlobalKey();
  final GlobalKey<ExerciseListViewState> exerciseListViewKey = GlobalKey();
  Function? closeCallback; 

  @override
  WorkoutsScreen({super.key, this.closeCallback});

  addToWorkout(Exercise selectedExercise){
    // add the workout to the workout view
    workoutBuilderViewKey.currentState?.viewAction(selectedExercise);
  } 

  removeFromWorkout(Exercise exerciseToRemove){
    // update the exercise list7
    exerciseListViewKey.currentState?.viewAction(exerciseToRemove);
  }

  randomExercise(){
    // depends on the state of the exercise list

  }
  randomWorkout() {
    // This probably should have been an api call but whatevs

  }

  saveWorkout(WidgetRef ref){
    // take the workout state and grab send the workout list to the active workout list
    Workout savedWorkout = Workout(name: "Test");
    savedWorkout.exercises = workoutBuilderViewKey.currentState?.itemList ?? [];
    print("WorkoutsScreen::saveWorkout - savedWorkout length: ${savedWorkout.exercises.length}");
    ref.read(activeWorkoutProvider.notifier).setActiveWorkout(savedWorkout);
    // close the window in navbar
    closeCallback!();
  }
  
  cancelWorkout(){
    // close out the screen and disc

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    child: Center(
                      child: ElevatedButton(
                        onPressed: (){ saveWorkout(ref); },
                        child: const Icon(Icons.add), ),),
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
