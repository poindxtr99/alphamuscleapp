import 'package:alphamuscle/src/realm/realm_services.dart';
import 'package:flutter/material.dart';
import 'package:alphamuscle/src/util/size_util.dart';
import 'package:alphamuscle/src/const/color_const.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/workouts_screen.dart';
import 'screens/favorites_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    SizeUtil.size = MediaQuery.of(context).size;
    final currentUser = Provider.of<RealmServices?>(context, listen: false)?.currentUser;
    print ("value of the currentUser: $currentUser");
    return MaterialApp(
      title: 'Alpha Muscle',
      theme: ThemeData(
        scaffoldBackgroundColor: offWhite,
        appBarTheme: const AppBarTheme(backgroundColor: offWhite),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: gray,
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            color: gray,
          ),
          headlineSmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: gray,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            color: gray,
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w200,
            fontStyle: FontStyle.italic,
            color: gray,
          ),
        ),
      ),
      onGenerateRoute: routes,
      home: const HomeScreen(),
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
      return const ProfileScreen();
    });
  } else if (settings.name == '/favorites') {
    return MaterialPageRoute(builder: (context) {
      return FavoritesScreen();
    });
  } else {
    return MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    });
  }
}
