import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fitness_app/screens/fitness_page.dart';
import 'package:fitness_app/screens/home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late int _currentIndex = 0;
  late List<Widget> _pages = [HomePage(), FitnessScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.red,
            onTap: _onTapped,
            unselectedItemColor: Colors.orange,
            selectedItemColor: Colors.blue,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph),
                label: "Graphs",
              ),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.settings), label: "Settings"),
              // BottomNavigationBarItem(icon: Icon(Icons.dining), label: ""),
            ]),
        body: _pages.elementAt(_currentIndex));
  }

  void _onTapped(int index) {
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }
}
