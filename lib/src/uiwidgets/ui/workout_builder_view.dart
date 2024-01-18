import 'package:flutter/material.dart';
import 'workout_builder_tile.dart';

class WorkoutBuilderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (ctx, index) {
            return WorkoutBuilderTile();
          }),
    );
  }
}
