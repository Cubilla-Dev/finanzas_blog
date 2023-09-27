import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class butt_opcion extends StatefulWidget {
  const butt_opcion({super.key});

  @override
  State<butt_opcion> createState() => _butt_opcionState();
}

class _butt_opcionState extends State<butt_opcion> {
  int _currentIndex = 0;
  final List<void Function()> funciones = [
    () {
      print('funcion 1');
    },
    () {
      print('funcion 2');
    },
    () {
      print('funcion 3');
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SafeArea(
            child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.4),
                offset: Offset(0, 25))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
        child: GNav(
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
              if (_currentIndex >= 0 && _currentIndex < funciones.length) {
                funciones[_currentIndex]();
              }
            },
            tabs: const [
              GButton(
                icon: LineIcons.heart,
                text: 'home',
                iconActiveColor: Colors.amber,
                textColor: Colors.black,
              ),
              GButton(
                icon: LineIcons.bookmark,
                // text: 'home',
                iconActiveColor: Colors.amber,
                textColor: Colors.black,
              ),
              GButton(
                icon: LineIcons.comments,
                text: 'home',
                iconActiveColor: Colors.amber,
                textColor: Colors.black,
              )
            ]),
      ),
    )));
  }
}
