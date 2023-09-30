import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class butt_opcion extends StatefulWidget {
  const butt_opcion({super.key});

  @override
  State<butt_opcion> createState() => _butt_opcionState();
}

class _butt_opcionState extends State<butt_opcion> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            spreadRadius: -10,
            blurRadius: 60,
            color: Colors.black.withOpacity(.4),
            offset: Offset(0, 25),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                LineIcons.heart,
                color: _currentIndex == 0 ? Colors.amber : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                LineIcons.bookmark,
                color: _currentIndex == 1 ? Colors.amber : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(
                LineIcons.comments,
                color: _currentIndex == 2 ? Colors.amber : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
