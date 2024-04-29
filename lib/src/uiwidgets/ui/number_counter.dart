import 'package:flutter/material.dart';
import 'package:alphamuscle/src/util/size_util.dart';

class NumberCounter extends StatefulWidget {
  final bool isVertical;
  final bool isInverted;
  final String label;

  const NumberCounter({super.key, required this.isVertical, required this.isInverted, required this.label});

  @override
  State<NumberCounter> createState() => _NumberCounterState();
}

class _NumberCounterState extends State<NumberCounter> {
  
  int currentValue = 0;

  void incrementValue(){
    setState(() {
      currentValue++;
    });
  }
  void decrementValue(){
    setState(() {
      currentValue > 0 ? currentValue-- : 0; 
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isVertical ? _buildVerticalCounter() : _buildHorizontalCounter();
  }

  Widget _buildVerticalCounter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: widget.isInverted ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Center(
              child: Text('$currentValue', 
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 50, 
                fontWeight: FontWeight.w700),)), //
            Column(
              children: [
                ElevatedButton(
                  onPressed: incrementValue,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    ),
                  child: const Icon(Icons.keyboard_arrow_up),
                  
                ), //button
                ElevatedButton(
                  onPressed: decrementValue, 
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  child: const Icon(Icons.keyboard_arrow_down)),
              ]
          )]
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label, 
            style: TextStyle(
              color: Colors.white, 
              fontSize:SizeUtil.getBothAxis(28.0), 
              fontWeight: FontWeight.w700),),
        ),
      ],
    );
  }

  Widget _buildHorizontalCounter() {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Center(child: Align(child: Center(child: Text('$currentValue', style: const TextStyle(fontSize: 20),))))],
            ),
          ),
          Flexible(
            flex: 40,
            child: Column(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: incrementValue, child: const Icon(Icons.arrow_drop_up)),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: decrementValue, child: const Icon(Icons.arrow_drop_down)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
