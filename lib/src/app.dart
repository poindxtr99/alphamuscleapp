import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/workouts_screen.dart';
import 'screens/favorites_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'Alpha Muscle',
      onGenerateRoute: routes,
      home: HomeScreen(),
    );
  }
}

Route routes(RouteSettings settings) {
  if (settings.name == '/wswizard') {
    return MaterialPageRoute(builder: (context) {
      return WorkoutsScreen();
    });
  } else if (settings.name == '/profile') {
    return MaterialPageRoute(builder: (context) {
      return ProfileScreen();
    });
  } else if (settings.name == '/favorites') {
    return MaterialPageRoute(builder: (context) {
      return FavoritesScreen();
    });
  } else {
    return MaterialPageRoute(builder: (context) {
      return HomeScreen();
    });
  }
}
