import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alphamuscle/src/providers/edit_workout_provider.dart';
import 'package:alphamuscle/src/models/workout.dart';
import 'package:alphamuscle/src/const/color_const.dart';
import '../../screens/profile_screen.dart';
import '../../screens/workouts_screen.dart';
import '../../screens/favorites_screen.dart';

class Navbar extends ConsumerStatefulWidget {
  final double appBarHeight;

  const Navbar({super.key, required this.appBarHeight});
  @override
  ConsumerState<Navbar> createState() {
    return _NavBarState();
  }
}

class _NavBarState extends ConsumerState<Navbar> with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;
  bool _isOpen = false;
  bool _showTabView = false;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);
    _tabcontroller.animateTo(0);
  }

  void openWindowTo(int tabValue) {
    setState(() {
      _isOpen = true;
      _tabcontroller.animateTo(tabValue);
    });
  }

  void closeWindow() {
    setState(() { 
      _isOpen = false; 
      // clear out any editable workouts so the state will be correct
      ref.read(editWorkoutProvider.notifier).clearWorkoutForEdit();
    });
  }
  // animate teh card (but which one?!)

  @override
  Widget build(context) {
    Workout editableworkout = ref.watch(editWorkoutProvider);
    if (!editableworkout.isEmpty) {
     openWindowTo(0);
    }

    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomRight,
            child: AnimatedOpacity(
              opacity: _isOpen ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: AnimatedContainer(
                  height: _isOpen ? (MediaQuery.of(context).size.height - widget.appBarHeight) : 50,
                  width: _isOpen ? (MediaQuery.of(context).size.width) : 50,
                  duration: const Duration(milliseconds: 500),
                  onEnd: () {
                    setState(() {
                       _showTabView = _isOpen;
                    });
                  },
                  child: Stack(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: _showTabView ? TabBarView(
                          controller: _tabcontroller,
                          children: [
                            WorkoutsScreen(closeCallback: closeWindow,),
                            FavoritesScreen(),
                            const ProfileScreen()
                          ]) : const Center(child: CircularProgressIndicator()),
                        ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromRadius(25),
                          shape: const CircleBorder(side:BorderSide.none),
                          backgroundColor: gray, 
                          elevation: 2.5
                        ),
                        onPressed: () => closeWindow(),
                        child: const Icon(Icons.close, color: orange,),
                      )
                    ],
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Card(
              color: gray,
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: SizedBox(
                  width: 180,
                  child: TabBar(
                      controller: _tabcontroller,
                      dividerColor: gray,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkGray
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      //padding: const EdgeInsets.all(2.0),
                      onTap: (value) {
                        setState(() {
                          if (!_isOpen) {
                            _isOpen = true; //open it!
                            _tabcontroller.animateTo(value);
                          }
                        });
                      },
                      tabs: const [
                        Tab(
                          icon: Icon(
                            size: 30.0,
                            Icons.add, 
                            color: orange,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.favorite,
                            color: orange,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            size: 30.0,
                            Icons.account_circle,
                            color: orange,
                          ),
                        ),
                      ])),
            ),
          ),
        ]),
      ),
    );
  }
}
