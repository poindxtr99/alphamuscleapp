import 'package:alphamuscle/src/models/workout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActiveWorkoutNotifier extends StateNotifier<Workout>{
  ActiveWorkoutNotifier() : super(Workout(name: "Default"));

  void setActiveWorkout(Workout workout){
    state = workout;
  }
}

final activeWorkoutProvider = StateNotifierProvider<ActiveWorkoutNotifier, Workout>((ref) {
  return ActiveWorkoutNotifier();
});

// create a method to change the value of the activeWorkoutProvider