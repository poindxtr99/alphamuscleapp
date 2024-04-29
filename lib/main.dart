import 'package:alphamuscle/src/models/exercise.dart';
import 'package:alphamuscle/src/models/exercise_category.dart';
import 'package:alphamuscle/src/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'src/app.dart';


void main() async{
  await Hive.initFlutter(); // this isn't needed in the browser
  Hive.registerAdapter<Workout>(WorkoutAdapter());
  Hive.registerAdapter<Exercise>(ExerciseAdapter());
  Hive.registerAdapter<ExerciseCategory>(ExerciseCategoryAdapter());
  await Hive.openBox<Workout>('favorites_workouts');
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(
    child: App(),));
  Future.delayed(const Duration(seconds: 5),() {
    FlutterNativeSplash.remove();
  });
}