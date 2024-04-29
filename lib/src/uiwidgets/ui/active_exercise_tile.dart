import 'package:flutter/material.dart';

enum TileState {isOpen, isClosed}

class ActiveExerciseTile extends StatefulWidget {
  //final Exercise data;
  final String data;  
  
  const ActiveExerciseTile({super.key, required this.data});
  @override
  State<ActiveExerciseTile> createState() => ActiveExerciseTileState();
}

class ActiveExerciseTileState extends State<ActiveExerciseTile> {
  TileState tileState = TileState.isClosed;
  void handleOnPressed(){
   setState(() {
       tileState = TileState.isOpen;
    });
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 8),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, 
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 20.0,
            spreadRadius: 1.0,
            blurStyle: BlurStyle.inner,
            offset: Offset(8.0, 5.0),
          )
        ]),
        child: ExpansionTile(
          title: Text(widget.data),
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                ),
                 child: const Icon(Icons.arrow_forward), )
              ],
            )
          ]
        ),
      ),
    );
  }
}
