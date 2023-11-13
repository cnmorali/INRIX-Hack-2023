import 'package:flutter/material.dart';
import 'package:mapbox_navigation/screens/destinations_map.dart';
import 'package:mapbox_navigation/screens/destinations_table.dart';

class HomeManagement extends StatefulWidget {
  const HomeManagement({Key? key}) : super(key: key);

  @override
  State<HomeManagement> createState() => _HomeManagementState();
}

class _HomeManagementState extends State<HomeManagement> {
  final List<Widget> _pages = [
    const RestaurantsMap(),
    const RestaurantsTable()
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (selectedIndex) {
          setState(() {
            _index = selectedIndex;
          });
        },
        currentIndex: _index,
        backgroundColor: Colors.lightGreen[400],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.house_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch_later), label: 'Past Rides'),
        ],
      ),
    );
  }
}
