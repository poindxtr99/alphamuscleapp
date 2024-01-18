import 'package:flutter/material.dart';

class NumberCounter extends StatelessWidget {
  final bool isVertical = true;

  NumberCounter({isVertical = true});

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
        Container(height: 20, child: Text('5')), //
        IconButton(
            onPressed: () => {}, icon: const Icon(Icons.arrow_drop_down)),
      ],
    );
  }

  Widget _buildHorizontalCounter() {
    return Row(
      children: [
        Column(
          children: [Container(height: 20, child: Text('5'))],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.arrow_drop_up)),
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.arrow_drop_down))
          ],
        )
      ],
    );
  }
}
