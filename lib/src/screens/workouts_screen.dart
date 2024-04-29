import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alphamuscle/src/providers/active_workout_provider.dart';
import 'package:alphamuscle/src/models/workout.dart';
import 'package:alphamuscle/src/const/color_const.dart';
import '../uiwidgets/ui/exercise_list_view.dart';
import '../uiwidgets/ui/workout_builder_view.dart';
import '../models/exercise.dart';

//this is where workouts get built
class WorkoutsScreen extends ConsumerWidget {

  // GlobalKey provides reference to the state for the workout builder and exercise list view
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
    // take the workout state and send the workout to the active workout list
    Workout savedWorkout = Workout(name: "Test");
    savedWorkout.exercises = workoutBuilderViewKey.currentState?.itemList ?? [];
    ref.read(activeWorkoutProvider.notifier).setActiveWorkout(savedWorkout);
    // close the window in navbar
    closeCallback!();
  }
  
  cancelWorkout(){
    // close out the screen and discard the current workout

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: offWhite,
          title: const Text('Workouts Screen')),
        body: Column(children: [
          WorkoutBuilderView(key: workoutBuilderViewKey, screenAction: removeFromWorkout),
          Row(children: [
              Flexible(
                fit: FlexFit.loose,
                  child: Container(
                    height: 50,
                  ),
                ),
              // Save button
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(side: BorderSide.none),
                        backgroundColor: gray,
                        minimumSize: const Size.fromRadius(20.0)
                      ),
                      onPressed: (){ saveWorkout(ref); },
                      child: const Icon(Icons.add_outlined, color: orange,), ),),
                ),
              ),
              // Random button
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: (){}, 
                      icon: const Icon(Icons.shuffle_outlined, color: gray,), 
                      label: const Text("Random", style: TextStyle(fontSize:15, color: gray),)),),
                ),
              ),
            ]),
          ExerciseListView(key: exerciseListViewKey, screenAction: addToWorkout)
        ]));
  }
}
