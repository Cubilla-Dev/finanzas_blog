import 'package:flutter/material.dart';
import 'package:flutter_app_1/src/pages/button_opcion.dart';
import 'package:http/http.dart';
import 'package:go_router/go_router.dart';

class Blog extends StatelessWidget {
  const Blog({required this.id});
  //recibimos el parametro enviado
  final String? id;
  @override
  Widget build(BuildContext context) {
    //recibimos el parametro
    // String? id;
    return Scaffold(
      body: cuerpo(context, id),
    );
  }
}

Widget cuerpo(BuildContext context, String? id) {
  return Scaffold(
    body: Center(
      child: Text('cuerpo'),
    ),
    bottomNavigationBar: butt_opcion(),
  );
}
