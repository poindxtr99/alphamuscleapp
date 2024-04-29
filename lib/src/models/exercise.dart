import 'package:hive/hive.dart';
import 'exercise_category.dart';
part 'exercise.g.dart';

@HiveType(typeId: 1)
class Exercise {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String videoUrl;
  @HiveField(2)
  final bool hasVideoLink;
  @HiveField(3)
  final String difficulty;
  @HiveField(4)
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
