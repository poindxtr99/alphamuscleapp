import "package:flutter/material.dart";
import "package:alphamuscle/src/uiwidgets/ui/exercise_tile.dart";
import "package:alphamuscle/src/util/scroll_to_util.dart";

class CategoryTile extends StatefulWidget {
  final List<String> data;
  final int categoryIndex;
  final Function tileAction;

  const CategoryTile({super.key, required this.data, required this.categoryIndex, required this.tileAction});


  @override
  State<CategoryTile> createState() => CategoryTileState();
}

class CategoryTileState extends State<CategoryTile> {
  final GlobalKey categoryTileKey = GlobalKey();

  List<Widget> _exerciseList() {
    return List<ExerciseTile>.generate(widget.data.length, (index) => ExerciseTile(
      data: widget.data[index],
      tileAction: widget.tileAction,
      ));
  }

  @override
  Widget build(context){

    return ExpansionTile(
      title: Text('Group ${widget.categoryIndex + 1}',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
      key: categoryTileKey,
      onExpansionChanged:(value) {
        if (value) {
          scrollToSelectedContent(expansionTileKey: categoryTileKey);
        }
      },
      children: _exerciseList(),);
  }
}