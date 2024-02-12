import 'package:flutter/material.dart';

class NumberCounter extends StatefulWidget {

  NumberCounter({required isVertical});

  @override
  State<NumberCounter> createState() => _NumberCounterState();
}

class _NumberCounterState extends State<NumberCounter> {
  final bool isVertical = false;
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
  Widget build(BuildContext context) {
    return isVertical ? _buildVerticalCounter() : _buildHorizontalCounter();
  }

  Widget _buildVerticalCounter() {
    return Column(
      children: <Widget>[
        IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.arrow_drop_up)), //button
        Container(height: 20, child: Text('$currentValue')), //
        IconButton(
            onPressed: () => {}, icon: const Icon(Icons.arrow_drop_down)),
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
