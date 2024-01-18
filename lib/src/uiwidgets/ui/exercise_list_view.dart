import 'package:flutter/material.dart';
import '../../data/dummy_categories.dart';

class ExerciseListView extends StatelessWidget {
  ExerciseListView({super.key});

  final List<List<String>> nestedList = [
    ['Item 1-1', 'Item 1-2', 'Item 1-3'],
    ['Item 2-1', 'Item 2-2', 'Item 2-3', 'Item 2-4'],
    ['Item 3-1', 'Item 3-2'],
  ];

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
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: nestedList[index].length,
                    itemBuilder: (ctx, nestedIndex) {
                      return ListTile(
                        title: Text(nestedList[index][nestedIndex]),
                      );
                    })
              ],
              //title: Text(exerciseCategories[index].category),
            );
          }),
    );
  }
}
