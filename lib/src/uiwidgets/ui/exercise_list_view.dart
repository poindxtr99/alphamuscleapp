import 'package:alphamuscle/src/models/exercise.dart';
import 'package:alphamuscle/src/uiwidgets/ui/category_tile.dart';
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

  final ScrollController _controller = ScrollController();

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

  void onExpand (double offset) {
    _controller.animateTo(offset, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          controller: _controller,
          shrinkWrap: true,
          itemCount: nestedList.length,
          itemBuilder: (ctx, index) {
            return CategoryTile(data: nestedList[index], categoryIndex: index, tileAction: tileAction);
          }),
    );
  }
}
