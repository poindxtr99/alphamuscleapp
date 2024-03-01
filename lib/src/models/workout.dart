import 'exercise.dart';

class Workout {
  String name;
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
}
