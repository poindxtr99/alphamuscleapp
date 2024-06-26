import 'package:alphamuscle/src/screens/alpha_dashboard_screen.dart';
import 'package:alphamuscle/src/screens/active_workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alphamuscle/src/const/color_const.dart';
import 'package:alphamuscle/src/providers/active_workout_provider.dart';
import 'package:alphamuscle/src/uiwidgets/ui/navbar.dart';
// need a reference to the active workouts provider

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
  // some questions: is the user logged in? do they have a previous workout?
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final activeWorkout = ref.watch(activeWorkoutProvider);
    _tabController.index = activeWorkout.exercises.isEmpty ? 0 : 1;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: offWhite
          ),
        backgroundColor: gray,
        centerTitle: false,
        title: const Text('Alpha Muscle'),
      ),
      body: Stack(
        children: [
          TabBarView(
              controller: _tabController,
              children: const [
              AlphaDashboardScreen(),
              ActiveWorkoutScreen()
            ]),
            Navbar(appBarHeight: AppBar().preferredSize.height),
        ],
      ),
    );
  }
}
