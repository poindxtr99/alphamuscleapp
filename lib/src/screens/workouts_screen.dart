import 'package:flutter/material.dart';
import '../uiwidgets/ui/exercise_list_view.dart';
import '../uiwidgets/ui/workout_builder_view.dart';

//this is where workouts get built
class WorkoutsScreen extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Workouts Screen')),
        body: Column(children: [
          WorkoutBuilderView(),
          Container(
            child: Row(children: [
              Container(
                width: 160,
                height: 50,
                color: Colors.green,
              ),
              Container(
                width: 160,
                height: 50,
                color: Colors.yellow,
              ),
              Container(
                width: 160,
                height: 50,
                color: Colors.orange,
              ),
            ]),
          ),
          ExerciseListView()
        ]));
  }
}
