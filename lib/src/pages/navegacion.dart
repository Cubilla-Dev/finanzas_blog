import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_app_1/src/pages/menu.dart';

class navegacion extends StatelessWidget {
  const navegacion({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height / 11;

    return SafeArea(
        child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(.4),
                    offset: Offset(0, 25))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: IconButton(
                    onPressed: () {
                      Menu();
                    },
                    icon: Icon(
                      LineIcons.opencart,
                    ), // Icono del segundo botón
                  ),
                ),
                Container(
                  // color: Colors.amberAccent,
                  alignment: Alignment.center,
                  child: Text(
                    'Finanzas',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  alignment: Alignment.center,
                  child: Row(children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(LineIcons.lockOpen), // Icono del primer botón
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LineIcons.alternateSignOut,
                      ), // Icono del segundo botón
                    )
                  ]),
                )
              ],
            )));
  }
}
