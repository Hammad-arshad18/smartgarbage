import 'package:flutter/material.dart';
import 'package:smartgarbage/screens/camera.dart';
import 'package:smartgarbage/screens/map.dart';
import 'package:smartgarbage/screens/myhome.dart';
import 'package:smartgarbage/screens/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  static const String id = "Homescreen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexbottomnavigation = 0;
  final screens_navigation = const [
    MyHome(),
    Camera(),
    Profile(),
    Maps(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: SalomonBottomBar(
            duration: const Duration(milliseconds: 800),
            currentIndex: _indexbottomnavigation,
            onTap: (index) {
              setState(() {
                _indexbottomnavigation = index;
              });
            },
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home_outlined),
                title: const Text("Home"),
                selectedColor: Colors.red,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.camera_alt_outlined),
                title: const Text("Camera"),
                selectedColor: Colors.orange,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person_outline_outlined),
                title: const Text("Profile"),
                selectedColor: Colors.deepPurpleAccent,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.location_on_outlined),
                title: const Text("Location"),
                selectedColor: Colors.green,
              ),
            ]),
      ),
      body: screens_navigation[_indexbottomnavigation],
    );
  }
}
