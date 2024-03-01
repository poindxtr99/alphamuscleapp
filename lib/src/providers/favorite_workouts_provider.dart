import 'package:alphamuscle/src/models/workout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteWorkoutsNotifier extends StateNotifier<List<Workout>>{
  FavoriteWorkoutsNotifier() : super([]);

  // when using StateNotifier you are not allowed to edit an existing value in memory; so let's create a new value
  void toggleFavoriteWorkoutStatus(Workout workout){
    if (state.contains(workout)) {
      state = state.where((w) => w.name != workout.name).toList();
    } else {
      state = [...state, workout]; // use the spread operator to 
    }
  }
}

final favoriteWorkoutsProvider = StateNotifierProvider<FavoriteWorkoutsNotifier, List<Workout>>((ref) {
  return FavoriteWorkoutsNotifier();
});