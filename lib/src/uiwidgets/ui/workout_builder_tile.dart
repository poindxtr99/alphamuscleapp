import 'package:alphamuscle/src/models/exercise.dart';
import 'package:flutter/material.dart';
import 'number_counter.dart';

class WorkoutBuilderTile extends StatelessWidget {
  double height;
  Exercise data;
  Function(Exercise) callBack;

  WorkoutBuilderTile({super.key, required this.height, required this.callBack, required this.data});

  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Container(
            width: 220,
            height: 150,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 25,
                  child: Container(
                          color: Colors.amber,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(child: Text('Test Header')),
                              Align(alignment: Alignment.centerRight, child: IconButton(onPressed: () => {callBack(data)}, icon: const Icon(Icons.delete)),)
                            ],
                          ),
                        )),
                        Flexible(
                  flex: 40,
                  child: Container(
                          color: Colors.amber,
                          alignment: Alignment.center,
                          child: Center(child: FloatingActionButton(onPressed: () => {callBack(data)},child: const Icon(Icons.play_arrow),)),
                        )),
                Flexible(
                  flex: 35,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    Flexible(
                        flex: 50,
                        child: Container(
                          color: Colors.amber,
                          alignment: Alignment.center,
                          child: NumberCounter(isVertical: false,),
                        )),
                    Flexible(
                        flex: 50,
                        child: Container(
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: NumberCounter(isVertical: false,),
                        )),
                  ]),
                ),
              ],
            )),
      ]),
    );
  }
}
