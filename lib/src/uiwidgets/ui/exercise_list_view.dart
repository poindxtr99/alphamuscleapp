import 'package:alphamuscle/src/models/exercise.dart';
import 'package:alphamuscle/src/uiwidgets/ui/exercise_tile.dart';
import 'package:flutter/material.dart';

enum ListState {isOpen, isClosed}

class ExerciseListView extends StatefulWidget {
  final Function(Exercise) screenAction;
  ListState listState = ListState.isClosed;
  final GlobalKey<ExerciseTileState> exerciseListViewKey = GlobalKey();
  ExerciseListView({super.key, required this.screenAction});

  @override
  State<ExerciseListView> createState() => ExerciseListViewState();
}

class ExerciseListViewState extends State<ExerciseListView> {

  final List<List<String>> nestedList = [
    ['Item 1-1', 'Item 1-2', 'Item 1-3'],
    ['Item 2-1', 'Item 2-2', 'Item 2-3', 'Item 2-4'],
    ['Item 3-1', 'Item 3-2'],
  ];
  //should be a map of active renderers
  Map<String, ExerciseTileState> activeRenderers = {};
  
  void viewAction (Exercise exerciseToAddBack) {
    //reactivate the tile
    activeRenderers[exerciseToAddBack.name]?.viewAction();
  }

  void tileAction (Exercise exerciseToAdd, ExerciseTileState stateRep) {
    //add to the workout builder view
    setState(() {
      widget.listState = widget.listState == ListState.isOpen ? ListState.isClosed : ListState.isOpen;
    });
    widget.screenAction(exerciseToAdd);
    activeRenderers[exerciseToAdd.name] = stateRep;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: nestedList.length,
          itemBuilder: (ctx, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Group ${index + 1}',
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: nestedList[index].length,
                    itemBuilder: (ctx, nestedIndex) {
                      return ExerciseTile(
                        data: nestedList[index][nestedIndex],
                        tileAction: tileAction
                      );
                    })
              ],
              //title: Text(exerciseCategories[index].category),
            );
          }),
    );
  }
}
