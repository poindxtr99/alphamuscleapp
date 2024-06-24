import 'package:alphamuscle/src/models/exercise.dart';
import 'package:flutter/material.dart';
import 'workout_builder_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WorkoutBuilderView extends StatefulWidget {

  final Function(Exercise) screenAction;
  const WorkoutBuilderView({super.key, required this.screenAction});
  
  @override
  State<WorkoutBuilderView> createState() => WorkoutBuilderViewState();
}

class WorkoutBuilderViewState extends State<WorkoutBuilderView> {
  List<Exercise> itemList = [];
  CarouselController builderCarouselController = CarouselController();

  void viewAction(Exercise newExercise) {
    setState(() {
      itemList.add(newExercise);
      builderCarouselController.animateToPage(itemList.length-1);
    });
  }
  void tileAction(Exercise exerciseToRemove) {
    setState(() {
      itemList.remove(exerciseToRemove);
    });
    widget.screenAction(exerciseToRemove);
  }

  double _calculateItemSize(int index, double scrollOffset, double center) {
    // Calculate the size based on the distance from the center
    double distanceFromCenter = (index * 100.0 - center).abs();
    double size = 100.0 - distanceFromCenter / 10.0; // Adjust the factor as needed
    return size.clamp(50.0, 100.0); // Clamp the size to a certain range
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.blue, // Set the background color as needed
          height: MediaQuery.of(context).size.height * 0.4,
          child: Center(
            child: CarouselSlider.builder(
              itemCount: itemList.length, 
              carouselController: builderCarouselController,
              itemBuilder: (ctx, index, pgidx) {
                double center = MediaQuery.of(context).size.width / 2;
                double scrollOffset = MediaQuery.of(context).size.width;
                double itemSize = _calculateItemSize(index, scrollOffset, center);
                return WorkoutBuilderTile(height:itemSize, callBack: tileAction, data: itemList[index],);
              }, 
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 0.75,
                reverse: true,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ))
          ),
        
      );
  }
}
