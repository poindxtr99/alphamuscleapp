import 'package:flutter/material.dart';
import 'number_counter.dart';

class WorkoutBuilderTile extends StatelessWidget {
  const WorkoutBuilderTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: 160,
          height: 150,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(flex: 75, child: Text("some string")),
                  Flexible(
                    flex: 25,
                    child: ElevatedButton(
                        onPressed: () => {}, child: const Icon(Icons.close)),
                  )
                ],
              ),
              Row(children: [
                Flexible(
                    flex: 20,
                    child: Container(
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: NumberCounter(),
                    )),
                Flexible(
                    flex: 60,
                    child: Container(
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Center(
                              child: FloatingActionButton(
                            onPressed: () => {},
                            child: Icon(Icons.play_arrow),
                          )),
                        ],
                      ),
                    )),
                Flexible(
                    flex: 20,
                    child: Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: NumberCounter())),
              ]),
              Row(
                children: [
                  Column(
                    children: [
                      Flexible(
                        child: NumberCounter(
                          isVertical: false,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Flexible(
                          child: NumberCounter(
                        isVertical: false,
                      ))
                    ],
                  )
                ],
              )
            ],
          )),
    ]);
  }
}
