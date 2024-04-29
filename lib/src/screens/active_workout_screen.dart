import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hive/hive.dart";
import "package:alphamuscle/src/models/workout.dart";
import "package:alphamuscle/src/providers/active_workout_provider.dart";
import "package:alphamuscle/src/uiwidgets/ui/active_exercise_tile.dart";
import "package:alphamuscle/src/providers/favorite_workouts_provider.dart";

class ActiveWorkoutScreen extends ConsumerStatefulWidget{
  const ActiveWorkoutScreen({super.key});

  @override
  ConsumerState<ActiveWorkoutScreen> createState() => _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends ConsumerState<ActiveWorkoutScreen> {
  final favoriteBox = "favorites_workouts";
  late Box<Workout> favoriteWorkoutsBox;

  @override
  void initState() {
    super.initState();
    favoriteWorkoutsBox = Hive.box(favoriteBox);
  }

  Widget _noActiveWorkout() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ready To Workout?  Click the button", 
                style: Theme.of(context).textTheme.headlineSmall),
                ElevatedButton(onPressed: (){}, child: const Icon(Icons.add)),
            ]);
  
  @override
  Widget build(BuildContext context) {
    //
    Workout activeWorkout =  ref.watch(activeWorkoutProvider);
    // check to see if it is already in the favorites list
    bool isFavorite = ref.watch(favoriteWorkoutsProvider.notifier).isFavorite(activeWorkout);

    return Container(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/am_logo.png"),
          ),
          (activeWorkout.exercises.isEmpty) ? _noActiveWorkout()
           : 
           Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Active Workout"),
                ),
              ), 
               // this should be the name of the workout????
              ElevatedButton(
                child: const Icon(Icons.edit_document),
                onPressed: () {},
              ),
              ElevatedButton(
                child: isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_outlined),
                onPressed: () {
                  setState(() {
                    isFavorite = ref.read(favoriteWorkoutsProvider.notifier).toggleFavoriteWorkoutStatus(activeWorkout);
                    // need to add a check here for if the user is signed but this will do for now, may need to move this check out of setState
                    if (isFavorite) {
                      //print("active_workout_screen::ElevatedButton_setState: ${activeWorkout.name ?? "null"}");
                      favoriteWorkoutsBox.put(activeWorkout.name, activeWorkout);
                    }
                    else {
                      if (favoriteWorkoutsBox.containsKey(activeWorkout.name)) {
                        favoriteWorkoutsBox.delete(activeWorkout.name);
                      }
                    }
                  });
                },
              ),
              ElevatedButton(
                child: const Icon(Icons.delete_forever),
                onPressed: () {
                  // delete the active workout 
                  ref.read(activeWorkoutProvider.notifier).clearActiveWorkout();
                },
              ),
            ],
            
          ), // the button row
           ListView.builder(
            shrinkWrap: true,
            itemCount: activeWorkout.exercises.length,
            itemBuilder: (ctx, index){
              return ActiveExerciseTile(data: activeWorkout.exercises[index].name);
            }
    )])],)),
    );
  }
}