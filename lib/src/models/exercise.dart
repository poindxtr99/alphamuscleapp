import 'exercise_category.dart';

class Exercise {
  final String name;
  final String videoUrl;
  final bool hasVideoLink;
  final String difficulty;
  final ExerciseCategory category;
  int sets = 3;
  int reps = 10;

  Exercise(
      {required this.name,
      required this.videoUrl,
      required this.hasVideoLink,
      required this.difficulty,
      required this.category});
}
