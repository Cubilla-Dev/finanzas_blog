import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = '';
  String body = '';
  List<MyData> data = [];
  // MyHomePage({required this.data});
  // final List<Map<String, dynamic>> jsonData = [];

//obtenemos el token que esta guardado adentro de celular
  Future<String?> obtenToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // final tokenGuardado = obtenToken();

  //hacemos la peticion al back
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.http('192.168.0.11:3000', '/smallblog'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        data = responseData.map((item) => MyData.fromJson(item)).toList();

        // token = await obtenToken();
      });
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Llama a la función para obtener datos del servidor al cargar la pantalla de inicio.
  }

  @override
  Widget build(BuildContext context) {
    //para obtener el width de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // void llamada() {
    //   context.go('/blog');
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Tarjeta '),
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: Color.fromARGB(255, 80, 155, 217),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context)
                    //     .pushNamedAndRemoveUntil('/blog', (route) => false);
                    context.goNamed('blog', pathParameters: {'id': '10'});
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(data[index].title),
                      subtitle: Text(data[index].body),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

// final List<Map<String, dynamic>> jsonData = [];
//para iterar un objeto
class MyData {
  final String title;
  final String body;

  MyData({required this.title, required this.body});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      title: json['title'],
      body: json['body'],
    );
  }
}
