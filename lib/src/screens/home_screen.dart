import 'package:alphamuscle/src/app.dart';
import 'package:flutter/material.dart';
import 'package:alphamuscle/src/uiwidgets/ui/navbar.dart';

class HomeScreen extends StatelessWidget {
  // some questions: is the user logged in? do they have a previous workout?
  //
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alpha Muscle'),
      ),
      body: Stack(
        children: [
          Navbar(),
        ],
      ),
    );
  }
}
