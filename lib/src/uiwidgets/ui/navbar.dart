import "package:flutter/material.dart";
import '../../screens/profile_screen.dart';
import '../../screens/workouts_screen.dart';
import '../../screens/favorites_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});
  @override
  State<Navbar> createState() {
    return _NavBarState();
  }
}

class _NavBarState extends State<Navbar> with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;
  bool _isOpen = false;
  final double _openHeight = 500;
  final double _openWidth = 500;
  final double _closedHeight = 500;
  final double _closedWidth = 500;

  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);
  }

  // animate teh card (but which one?!)

  @override
  Widget build(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomRight,
          child: AnimatedOpacity(
            opacity: _isOpen ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: AnimatedContainer(
                height: _isOpen ? 500 : 50,
                width: _isOpen ? 500 : 50,
                duration: const Duration(milliseconds: 500),
                child: Stack(
                  children: [
                    Card(
                        elevation: 2.0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: TabBarView(
                            controller: _tabcontroller,
                            children: [
                              WorkoutsScreen(),
                              FavoritesScreen(),
                              ProfileScreen()
                            ])),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _isOpen = false;
                      }),
                      child: const Icon(Icons.close),
                    )
                  ],
                )),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
                width: 150,
                child: TabBar(
                    controller: _tabcontroller,
                    onTap: (value) {
                      setState(() {
                        if (!_isOpen) {
                          _isOpen = true; //open it!
                        }
                      });
                    },
                    tabs: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.cyan.shade400,
                      ),
                      Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                    ])),
          ),
        ),
      ]),
    );
  }
}
