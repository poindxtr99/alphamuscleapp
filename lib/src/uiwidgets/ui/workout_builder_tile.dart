import 'package:alphamuscle/src/models/exercise.dart';
import 'package:alphamuscle/src/util/size_util.dart';
import 'package:alphamuscle/src/const/color_const.dart';
import 'package:flutter/material.dart';
import 'number_counter.dart';

class WorkoutBuilderTile extends StatelessWidget {
  double height;
  Exercise data;
  Function(Exercise) callBack;

  WorkoutBuilderTile({super.key, required this.height, required this.callBack, required this.data});

  Widget _tileLabel() => Container();


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            left: SizeUtil.getAxisX(3.0),
            right: SizeUtil.getAxisX(3.0),
            top: SizeUtil.getAxisY(5.0),
            bottom: SizeUtil.getAxisY(5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black
              ),
            ),
          ),
          Positioned(
            left: SizeUtil.getAxisX(50.0),
            right: SizeUtil.getAxisX(50.0),
            top: SizeUtil.getAxisY(5.0),
            bottom: SizeUtil.getAxisY(5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/weight_workout_gr.jpg")),),
            )),
          Positioned(
            left: SizeUtil.getAxisX(50.0),
            right: SizeUtil.getAxisX(50.0),
            top: SizeUtil.getAxisY(5.0),
            bottom: SizeUtil.getAxisY(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: textBlackLight,
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
          Positioned(
            top: SizeUtil.getAxisY(115.0),
            left: 0.0,
            child: const NumberCounter(isVertical: true, isInverted: true, label: "Reps",)
          ),
          Positioned(
            top: SizeUtil.getAxisY(115.0),
            right: 0.0,
            child: const NumberCounter(isVertical: true, isInverted: false, label: "Sets",)
          ),
          Positioned(
            top: SizeUtil.getAxisY(7.0),
            right: SizeUtil.getAxisX(0.0),
            child: ElevatedButton(
              onPressed: () {callBack(data);},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.delete_forever),
            )),

      ]);
  }
}
