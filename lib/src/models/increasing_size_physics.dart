import 'package:flutter/material.dart';

class IncreasingSizePhysics extends ScrollPhysics {
  const IncreasingSizePhysics({ScrollPhysics? parent});

  @override
  IncreasingSizePhysics applyTo(ScrollPhysics? ancestor) {
    return IncreasingSizePhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Apply any custom physics to the user's scrolling offset if needed
    return offset;
  }

  // @override
  // Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
  //   // Apply custom physics for the ballistic simulation if needed
  //   return super.createBallisticSimulation(position, velocity);
  // }
}