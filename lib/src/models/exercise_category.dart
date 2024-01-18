import 'package:flutter/material.dart';

enum Categories { legs, arms, back, shoulders, core }

class ExerciseCategory {
  final String category;
  final List exercises;

  const ExerciseCategory(this.category, this.exercises);
}
