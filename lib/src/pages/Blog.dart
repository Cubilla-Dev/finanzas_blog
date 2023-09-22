import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:go_router/go_router.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});
  @override
  Widget build(BuildContext context) {
    //recibimos el parametro
    String? id;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi blog'),
      ),
      body: cuerpo(context, id),
    );
  }
}

Widget cuerpo(BuildContext context, id) {
  return Container(
    child: Center(
      child: Text('Mi blog cuerpo $id'),
    ),
  );
}
