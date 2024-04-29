import 'package:hive/hive.dart';
part 'exercise_category.g.dart';


enum Categories { legs, arms, back, shoulders, core }

@HiveType(typeId: 2)
class ExerciseCategory {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final List exercises;

  const ExerciseCategory(this.category, this.exercises);
}
