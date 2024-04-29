import 'package:hive/hive.dart';

import 'exercise.dart';

part 'workout.g.dart';

@HiveType(typeId: 0)
class Workout {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<Exercise> exercises = [];
  int totalSets = 3;
  int totalReps = 10;

  Workout({required this.name});

  void toggleExercise (Exercise exercise) {
    if (exercises.contains(exercise)) {
      exercises.remove(exercise);
    } else {
      exercises.add(exercise);
    }
  }

  void setWorkoutID(String newID){
    name = newID;
  }

  bool get isEmpty => exercises.isEmpty;
}
