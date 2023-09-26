import 'package:flutter/material.dart';
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
  return Container(
    child: Center(
      child: Text('Mi blog cuerpo $id'),
    ),
  );
}
