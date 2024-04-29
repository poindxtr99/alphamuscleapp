import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import "package:alphamuscle/src/models/workout.dart";
import "package:alphamuscle/src/uiwidgets/ui/favorite_workout_tile.dart";


class FavoritesScreen extends StatelessWidget {

  final favoriteBox = "favorites_workouts";
  late Box<Workout> favoriteWorkoutsBox = Hive.box(favoriteBox);

  FavoritesScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites Screen')),
      body:  ListView.builder(
            shrinkWrap: true,
            itemCount: favoriteWorkoutsBox.length,
            itemBuilder: (ctx, index){
              return FavoriteWorkoutTile(data: favoriteWorkoutsBox.getAt(index)!);
            }
    ),
    );
  }
}
