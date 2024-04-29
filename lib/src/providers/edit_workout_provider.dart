import 'package:alphamuscle/src/models/workout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditWorkoutNotifier extends StateNotifier<Workout> {
  EditWorkoutNotifier() : super(Workout(name: "Default"));

  void setWorkoutForEdit(Workout workout) {
    state = workout;
  }

  void clearWorkoutForEdit() {
    print("edit_workout_provider::clearWorkoutForEdit");
    state = Workout(name: "Default");
  }
}

final editWorkoutProvider = StateNotifierProvider<EditWorkoutNotifier, Workout>((ref) {
  return EditWorkoutNotifier();
});