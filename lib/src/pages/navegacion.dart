import 'package:flutter/material.dart';

class navegacion extends StatelessWidget {
  const navegacion({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height / 9;

    return Column(children: [
      Container(
        color: Colors.blue,
        height: screenHeight,
        width: screenWidth,
        child: Center(
          child: Row(
            children: [
              const Expanded(
                child: Align(
                  alignment: Alignment(-0.3, 0.4),
                  child: Text(
                    'Finanzas',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.3, 1),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Login')),
                    ElevatedButton(onPressed: () {}, child: Text('Login'))
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.abc), // Icono del primer botón
                    // ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.ac_unit), // Icono del segundo botón
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
